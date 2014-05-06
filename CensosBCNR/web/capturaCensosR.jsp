<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="conn.ConectionDB"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" session="true" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    //----------------------------------Módulo de Sesiones
    HttpSession sesion = request.getSession();
    String id_uni = "";
    session.getId();
    ConectionDB con = new ConectionDB();
    int ban = 0;

    id_uni = (String) sesion.getAttribute("id_uni");
    try {
        con.conectar();
        ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and clave.id_uni = '" + id_uni + "';");
        while (rset.next()) {
            ban = 1;

%>
<%    DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
    simbolos.setDecimalSeparator('.');
    simbolos.setGroupingSeparator(',');
    DecimalFormat forma2 = new DecimalFormat("##,###.##", simbolos);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <!-- DW6 -->
    <head>

        <!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
        <title>:: CAPTURA DE CENSOS ::</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/datepicker3.css" rel="stylesheet" />
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
        <link  href="css/bootstrap-responsive.css" rel="stylesheet" />
        <link href="css/jumbotron-narrow.css" rel="stylesheet" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />


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
            -->
        </style>
    </head>
    <body>

        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="indexCapR.jsp">Men&uacute;</a></li>
                    <li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                    <li><a data-toggle="modal" href="#myModal">Sistemas</a></li>
                    <li><a href="salirCaptura.jsp">Salir</a></li>
                </ul>
                <h3 class="text-primary"><a name="top" id="top"></a>Captura de Censos Rurales</h3>
            </div>
        </div>



        <table width="900px" border="0" align="center" cellpadding="0" cellspacing="0">

            <tr>
                <td colspan="12">
                    <div class="panel panel-primary">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <strong>LLENE LOS CAMPOS CON LAS RESPUESTAS OBTENIDAS</strong>
                        </div>
                    </div>
                </td>
            </tr>
            <td>
                <td colspan="3"  class="style58">
                    <p>Bienvenido</p>
                </td>

                </tr>
                <tr>
                    <td colspan="7"  class="style58">
                        Estatus del Censo:<br />
                        <%
                            float total = 0;
                            for (int i = 1; i <= 31; i++) {
                                if (rset.getString("campo_" + i).equals("")) {
                                    total++;
                                    out.println("Sección A incompleta - ");
                                    break;
                                }
                            }

                        %>
                        <%                                    for (int i = 32; i <= 45; i++) {
                                if (rset.getString("campo_" + i).equals("")) {
                                    total++;
                                    out.println("Sección B incompleta - ");
                                    break;
                                }
                            }

                        %>
                        <%                                    for (int i = 46; i <= 54; i++) {
                                if (rset.getString("campo_" + i).equals("")) {
                                    total++;
                                    out.println("Sección C incompleta - ");
                                    break;
                                }
                            }

                        %>
                        <%                                    for (int i = 55; i <= 62; i++) {
                                if (rset.getString("campo_" + i).equals("")) {
                                    total++;
                                    out.println("Sección D incompleta - ");
                                    break;
                                }
                            }

                        %>
                        <%                                    for (int i = 63; i <= 70; i++) {
                                if (rset.getString("campo_" + i).equals("")) {
                                    total++;
                                    out.println("Sección E incompleta - ");
                                    break;
                                }
                            }

                        %>
                        <%                                    for (int i = 71; i <= 71; i++) {
                                if (rset.getString("campo_" + i).equals("")) {
                                    total++;
                                    out.println("Sección F incompleta - ");
                                    break;
                                }
                            }
                            float avance = total / 6;
                        %>

                    </td>
                </tr>

                <tr>
                    <td colspan="7"><div class="panel panel-primary">Porcentaje de Avance =<%=forma2.format((1 - avance) * 100)%> %</div></td>
                </tr>
                <%
                    try {
                        con.conectar();
                        try {
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
                    <td colspan="3"  class="style58">Seleccione Secci&oacute;n
                        <a href="#a"><input name="a" id="btn_aa" data-toggle="tooltip" title="A. DATOS GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="A" /> </a>
                        <a href="#b"><input name="b" id="btn_bb" data-toggle="tooltip" title="B. TAREAS OPERACIONALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="B" /></a>
                        <a href="#c"><input name="c" id="btn_cc" data-toggle="tooltip" title="C. FARMACIA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="C" /></a>
                        <a href="#d"><input name="d" id="btn_dd" data-toggle="tooltip" title="D. ALMACÉN" type="button" data-loading-text="Loading..." class="btn btn-primary" value="D" /></a>
                        <a href="#e"><input name="e" id="btn_ee" data-toggle="tooltip" title="E. EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA" type="button" data-loading-text="Loading..." class="btn btn-primary" value="E" /></a>
                        <a href="#f"><input name="f" id="btn_ff" data-toggle="tooltip" title="F. DESCRIBA OBSERVACIONES Y/O COMENTARIO GENERALES" type="button" data-loading-text="Loading..." class="btn btn-primary" value="F" /></a>
                    </td>
                </tr>
                <tr>
                    <td colspan="12"  class="style58">Elaborado Por: <input name="txtf_elab" id="txtf_elab" type="text" class="form-control neg" onkeypress="return handleEnter(this, event);" size="40" readonly="true" value="<%=(String) sesion.getAttribute("encuestador")%> - GNK Log&iacute;stica S.A. de C.V." /></td>
                </tr>
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
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
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
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);"><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                        <td>&nbsp;</td>
                        <td bgcolor="#FFFFFF" class="style58">A.4</td>
                        <td class="style58"><div align="left">Colonia</div></td>
                        <td><span class="style49">

                                <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
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

                                <label>   <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="5" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
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
                        <td class="style58"><div align="left">Tel&eacute;fono fijo</div><br/>Si no tienen escribir: (000) 000-00000</td>
                        <td class="style58">
                            <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="14" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="LP_data();
                                    anade(this);
                                    return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                            <%//out.print(nombreC);%></label>  
                        </td>
                    </tr>
                    <tr>
                        <td class="style58">
                            <div align="center">A.9</div>
                        </td>
                        <td class="style58">Fax<br/>Si no tienen escribir: (000) 000-00000</td>
                        <td class="style33">
                            <strong>
                                <label>
                                    <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="14" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="LP_data();
                                            anade(this);
                                            return isNumberKey(event, this);" value="NA" readonly />
                                    <%//out.print(nombreC);%></label> 

                            </strong>
                        </td>
                        <td>&nbsp;</td>
                        <td bgcolor="#FFFFFF" class="style58">A.10</td>
                        <td class="style58"><div align="left"></div>Correo Electr&oacute;nico</td>
                        <td><span class="style49">
                                <label> <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
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
                        <td> <label><!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return isNumberKey(event);" ></textarea-->
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="2" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
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
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
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
                                    <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="14" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="LP_data();
                                            anade(this);
                                            return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                    <%//out.print(nombreC);%>
                                </label>
                            </strong>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.18</td>
                        <td class="style58">Correo Elect. Responsable</td>
                        <td>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>    

                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">A.19</div></td>
                        <td class="style58">Nombre del Odont&oacute;logo </td>
                        <td class="style33"><strong>
                                <label>
                                    <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%//out.print(nombreC);%>
                                </label>
                            </strong></td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.20</td>
                        <td class="style58">Poblaci&oacute;n Atendida</td>
                        <td>
                            <label>
                                <!--input type="text" name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="6" class="form-control" id="<%//=nombreC%>" name="<%//=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%//=rset.getString(nombreC)%>" /-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return tabular(event, this);" onchange="cambiaC();" id="<%=nombreC%>">
                                    <option value="">-- ESCOJA CANTIDAD --</option>
                                    <option value="1 A 500 HABITANTES" <% if (rset.getString(nombreC).equals("1 A 500 HABITANTES")) {
                                            out.println("selected");
                                        }%> >1 A 500 HABITANTES</option>
                                    <option value="501 A 1,000 HABITANTES" <% if (rset.getString(nombreC).equals("501 A 1,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >501 A 1,000 HABITANTES</option>
                                    <option value="1,001 A 2,500 HABITANTES" <% if (rset.getString(nombreC).equals("1,001 A 2,500 HABITANTES")) {
                                            out.println("selected");
                                        }%> >1,001 A 2,500 HABITANTES</option>
                                    <option value="2,501 A 5,000 HABITANTES" <% if (rset.getString(nombreC).equals("2,501 A 5,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >2,501 A 5,000 HABITANTES</option>
                                    <option value="5,001 A 10,000 HABITANTES" <% if (rset.getString(nombreC).equals("5,001 A 10,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >5,001 A 10,000 HABITANTES</option>
                                    <option value="10,001 A 25,000 HABITANTES" <% if (rset.getString(nombreC).equals("10,001 A 25,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >10,001 A 25,000 HABITANTES</option>
                                    <option value="25,001 A 50,000 HABITANTES" <% if (rset.getString(nombreC).equals("25,001 A 50,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >25,001 A 50,000 HABITANTES</option>
                                    <option value="50,001 A 100,000 HABITANTES" <% if (rset.getString(nombreC).equals("50,001 A 100,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >50,001 A 100,000 HABITANTES</option>
                                    <option value="100,001 A 250,000 HABITANTES" <% if (rset.getString(nombreC).equals("100,001 A 250,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >100,001 A 250,000 HABITANTES</option>
                                    <option value="250,001 A 500,000 HABITANTES" <% if (rset.getString(nombreC).equals("250,001 A 500,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >250,001 A 500,000 HABITANTES</option>
                                    <option value="500,001 A 1,000,000 HABITANTES" <% if (rset.getString(nombreC).equals("500,001 A 1,000,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >500,001 A 1,000,000 HABITANTES</option>
                                    <option value="1,000,001 A 5,000,000 HABITANTES" <% if (rset.getString(nombreC).equals("1,000,001 A 5,000,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >1,000,001 A 5,000,000 HABITANTES</option>
                                    <option value="+ DE 5,000,000 HABITANTES" <% if (rset.getString(nombreC).equals("+ DE 5,000,000 HABITANTES")) {
                                            out.println("selected");
                                        }%> >+ DE 5,000,000 HABITANTES</option>

                                </select>
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
                                    <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="3" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                    <%//out.print(nombreC);%>
                                </label>
                            </strong>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.22</td>
                        <td class="style58">No. Mapa </td>
                        <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);"  ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>    
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">A.23</div></td>
                        <td class="style58">N&ordm; de Pasantes</td>
                        <td class="style33"><strong>
                                <label>
                                    <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="3" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                    <%//out.print(nombreC);%></label>   

                            </strong></td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.24</td>
                        <td class="style58">N&ordm; de Enfermeras</td>
                        <td> <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="3" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
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
                                <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            if (i != 24) {
                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        }
                                    %>
                                </select>
                                <%//out.print(nombreC);%></label> 
                                <br />
                                <label><span class="style58">Hasta :</span></label>
                                <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            if (i != 24) {
                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        }
                                    %>
                                </select>
                                <label><span class="style58">&nbsp;</span>
                                    <%//out.print(nombreC);%></label>   

                            </strong></td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.27</td>
                        <td class="style58">Dias Laborales</td>
                        <td> <label><!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="LUNES A VIERNES" <% if (rset.getString(nombreC).equals("LUNES A VIERNES")) {
                                            out.println("selected");
                                        }%> >L - V</option>
                                    <option value="LUNES A SABADO" <% if (rset.getString(nombreC).equals("LUNES A SABADO")) {
                                            out.println("selected");
                                        }%> >L - S</option>
                                    <option value="LUNES A DOMINGO" <% if (rset.getString(nombreC).equals("LUNES A DOMINGO")) {
                                            out.println("selected");
                                        }%> >L - D</option>
                                </select>
                                <%//out.print(nombreC);%></label>    
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">A.28</div></td>
                        <td class="style58">¿La Unidad cuenta con Servicios?</td>
                        <td class="style33"><strong>
                                <label>
                                    <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                    <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="cambiaA();" id="<%=nombreC%>">
                                        <option value="">Seleccione una opción</option>
                                        <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                out.println("selected");
                                            }%> >Si</option>
                                        <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                out.println("selected");
                                            }%> >No</option>
                                    </select>
                                    <%//out.print(nombreC);%></label> 

                            </strong></td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.29</td>
                        <td class="style58">¿Cu&aacute;ntos Servicios?</td>
                        <td> <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="3" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%></label>    
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">A.30</div></td>
                        <td class="style58">Describa los Servicios</td>
                        <td class="style33"><strong>
                                <label>
                                    <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                    <%//out.print(nombreC);%></label> 

                            </strong></td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58">A.31</td>
                        <td class="style58">Clima Predominante</td>
                        <td> <label><!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="MUY SECO" <% if (rset.getString(nombreC).equals("MUY SECO")) {
                                            out.println("selected");
                                        }%> >MUY SECO</option>
                                    <option value="SEMISECO" <% if (rset.getString(nombreC).equals("SEMISECO")) {
                                            out.println("selected");
                                        }%> >SEMISECO</option>
                                    <option value="TEMPLADO - SUBHÚMEDO" <% if (rset.getString(nombreC).equals("TEMPLADO - SUBHÚMEDO")) {
                                            out.println("selected");
                                        }%> >TEMPLADO - SUBHÚMEDO</option>
                                </select>
                                <%//out.print(nombreC);%></label>    
                        </td>
                    </tr>
                    <tr>

                        <td colspan="7" class="style58">
                            <div class="panel panel-primary">
                                <!-- Default panel contents -->
                                <button type="submit" name="guarda_seccion" value="A" class="btn btn-primary btn-lg btn-block" onclick="return validar_a()">Guardar datos Secci&oacute;n A</button>
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
                                     <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                    <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="cambiaB();" id="<%=nombreC%>">
                                        <option value="">Seleccione una opción</option>

                                        <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                out.println("selected");
                                            }%> >Si</option>
                                        <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                out.println("selected");
                                            }%> >No</option>
                                    </select>
                                    <%//out.print(nombreC);%>
                                </label>
                            </span>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.2</div></td>
                        <td class="style58">&iquest;Cu&aacute;ntas Recetas Promedio por d&iacute;a se expiden?</td>
                        <td>
                            <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="5" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%>
                            </label>    
                        </td>
                    </tr>

                    <tr>
                        <td class="style58"><div align="center">B.3</div></td>
                        <td class="style58">&iquest;Cuántos medicamentos preescribe en promedio por receta?</td>
                        <td>
                            <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="3" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.4</div></td>
                        <td class="style58">Describa el proceso de captura de las recetas</td>
                        <td>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                    </tr>

                    <tr>
                        <td class="style58"><div align="center">B.5</div></td>
                        <td class="style58">¿Cu&aacute;l es el consumo promedio mensual de piezas?</td>
                        <td>
                            <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="6" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%></label>  
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.6</div></td>
                        <td class="style58">N&uacute;mero de Claves Autorizadas para este Centro </td>
                        <td> 
                            <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="4" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
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
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="4" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%>
                            </label>  
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.8</div></td>
                        <td class="style58">&iquest;Cu&aacute;l es el Procedimiento de Reposici&oacute;n de Inventarios?</td>
                        <td> <label>
<!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="CON BASE AL CONSUMO" <% if (rset.getString(nombreC).equals("CON BASE AL CONSUMO")) {
                                            out.println("selected");
                                        }%> >CON BASE AL CONSUMO</option>
                                    <option value="ENTREGA SECRETARIA" <% if (rset.getString(nombreC).equals("ENTREGA SECRETARIA")) {
                                            out.println("selected");
                                        }%> >ENTREGA SECRETARÍA</option>
                                    <option value="POR REQUERIMIENTO" <% if (rset.getString(nombreC).equals("POR REQUERIMIENTO")) {
                                            out.println("selected");
                                        }%> >POR REQUERIMIENTO</option>
                                    <option value="LAS BRIGADAS HACEN EL REQUERIMIENTO" <% if (rset.getString(nombreC).equals("LAS BRIGADAS HACEN EL REQUERIMIENTO")) {
                                            out.println("selected");
                                        }%> >LAS BRIGADAS HACEN EL REQUERIMIENTO</option>
                                </select>
                                <textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" readonly="readonly" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label></td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">B.9</div></td>
                        <td class="style58">¿Qui&eacute;n surte a esta Unidad de Atenci&oacute;n?</td>
                        <td>
                            <label>
                                <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="ALMACEN JURIDICCIONAL - SSBC" <% if (rset.getString(nombreC).equals("ALMACEN JURIDICCIONAL - SSBC")) {
                                            out.println("selected");
                                        }%> >ALMACEN JURIDICCIONAL - SSBC</option>


                                </select>
                                <%//out.print(nombreC);%>
                                <textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" readonly="readonly" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                            </label>  
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.10</div></td>
                        <td class="style58">¿Con qu&eacute; frecuencia? </td>
                        <td>
                            <label>
                                <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="SEMANAL" <% if (rset.getString(nombreC).equals("SEMANAL")) {
                                            out.println("selected");
                                        }%> >SEMANAL</option>
                                    <option value="QUINCENAL" <% if (rset.getString(nombreC).equals("QUINCENAL")) {
                                            out.println("selected");
                                        }%> >QUINCENAL</option>
                                    <option value="MENSUAL" <% if (rset.getString(nombreC).equals("MENSUAL")) {
                                            out.println("selected");
                                        }%> >MENSUAL</option>
                                    <option value="CADA 2 MESES" <% if (rset.getString(nombreC).equals("CADA 2 MESES")) {
                                            out.println("selected");
                                        }%> >CADA 2 MESES</option>
                                    <option value="CADA 3 MESES" <% if (rset.getString(nombreC).equals("CADA 3 MESES")) {
                                            out.println("selected");
                                        }%> >CADA 3 MESES</option>
                                    <option value="DE 4 A 6 MESES" <% if (rset.getString(nombreC).equals("DE 4 A 6 MESES")) {
                                            out.println("selected");
                                        }%> >DE 4 A 6 MESES</option>
                                    <option value="DE 6 A 8 MESES" <% if (rset.getString(nombreC).equals("DE 6 A 8 MESES")) {
                                            out.println("selected");
                                        }%> >DE 6 A 8 MESES</option>
                                    <option value="DE 8 MESES A UN AÑO" <% if (rset.getString(nombreC).equals("DE 8 MESES A UN AÑO")) {
                                            out.println("selected");
                                        }%> >DE 8 MESES A UN AÑO</option>
                                    <option value="MAS DEL AÑO" <% if (rset.getString(nombreC).equals("MAS DEL AÑO")) {
                                            out.println("selected");
                                        }%> >MAS DEL AÑO</option>
                                </select>
                                <%//out.print(nombreC);%>
                                <textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" readonly="readonly" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">B.11</div></td>
                        <td class="style58">¿Cu&aacute;l es el nivel de abasto actual?</td>
                        <td>
                            <label>
                                <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 1; i <= 10; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + "0%")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + "0%</option>");
                                        }
                                    %>
                                </select>
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.12</div></td>
                        <td class="style58">¿Realizan inventarios en la unidad? </td>
                        <td> <label> <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <%//out.print(nombreC);%></label></td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">B.13</div></td>
                        <td class="style58">¿D&oacute;nde se guarda el insumo?</td>
                        <td>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%>
                            </label>  
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">B.14</div></td>
                        <td class="style58">¿Esta unidad esta certificada? </td>
                        <td>
                            <label>
                                <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>

                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">B.15</div></td>
                        <td width="297" class="style58">Fecha de &uacute;ltima visita de Abasto</td>
                        <td width="369" class="style58">
                            <label>
                                <input data-date-format="dd/mm/yyyy"  name="<%=nombreC = nomCam + (contCam += 1)%>" id="<%=nombreC%>"  class="form-control" type="text" readonly value="<%=rset.getString(nombreC)%>"  />
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
                                <button type="submit" name="guarda_seccion" value="B" class="btn btn-primary btn-lg btn-block" onclick="return validar_b()">Guardar datos Secci&oacute;n B</button>
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
                                    <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                    <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="cambiaC();" id="<%=nombreC%>">
                                        <option value="">Seleccione una opción</option>
                                        <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                out.println("selected");
                                            }%> >Si</option>
                                        <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                out.println("selected");
                                            }%> >No</option>
                                    </select>
                                    <%//out.print(nombreC);%>
                                </label>   
                            </span>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">C.2</div></td>
                        <td class="style58">¿Maneja Controlados?</td>
                        <td> <label><!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                            <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                            <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                <%
                                    for (int i = 0; i <= 24; i++) {
                                        out.println("<option ");
                                        if (rset.getString(nombreC).equals(i + ":00")) {
                                            out.println("selected");
                                        }
                                        out.println(">" + i + ":00</option>");
                                        out.println("<option ");
                                        if (rset.getString(nombreC).equals(i + ":30")) {
                                            out.println("selected");
                                        }
                                        out.println(">" + i + ":30</option>");
                                    }
                                %>
                            </select>
                            <%//out.print(nombreC);%></label> 
                            <br />
                            <span class="style58">A:</span>
                            <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                            <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                <%
                                    for (int i = 0; i <= 24; i++) {
                                        out.println("<option ");
                                        if (rset.getString(nombreC).equals(i + ":00")) {
                                            out.println("selected");
                                        }
                                        out.println(">" + i + ":00</option>");
                                        out.println("<option ");
                                        if (rset.getString(nombreC).equals(i + ":30")) {
                                            out.println("selected");
                                        }
                                        out.println(">" + i + ":30</option>");
                                    }
                                %>
                            </select>
                            <%//out.print(nombreC);%></label> 
                            </label></td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">C.4</div></td>
                        <td class="style58">¿Qui&eacute;n atiende la farmacia?</td>
                        <td>
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>

                                <%//out.print(nombreC);%>

                            </label>    
                        </td>
                    </tr>
                    <tr>
                        <td class="style47"><div align="center" class="style58">C.5</div></td>
                        <td class="style58">N&ordm;  de Anaqueles</td>
                        <td>
                            <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="4" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%>
                            </label>  
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">C.6</div></td>
                        <td class="style58">Espacio aprox en mts de la Farmacia </td>
                        <td> 
                            <label>
                                <div class="col-sm-6"><input type="text" name="largoFarm" maxlength="4" class="form-control" id="largoFarm" onkeypress="return isNumberKey(event, this);" onkeyup="areaFarm();" value="" /></div>
                                <div class="col-sm-6"><input type="text" name="anchoFarm" maxlength="4" class="form-control" id="anchoFarm" onkeypress="return isNumberKey(event, this);" onkeyup="areaFarm();" value="" /></div>
                                <div class="col-sm-12"><input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="4" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" readonly /></div>

                                <%//out.print(nombreC);%>
                            </label>    
                        </td>
                    </tr>
                    <tr>
                        <td class="style47"><div align="center" class="style58">C.7</div></td>
                        <td class="style58">¿Se cuenta con red fr&iacute;a?</td>
                        <td class="style58"><label>
                                <label>  <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                    <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                        <option value="">Seleccione una opción</option>
                                        <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                out.println("selected");
                                            }%> >Si</option>
                                        <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                out.println("selected");
                                            }%> >No</option>
                                    </select>
                                    <%//out.print(nombreC);%></label> 
                        </td>
                        <td class="hidden">&nbsp;</td>
                        <td class="hidden"><div align="center" class="style58">C.8</div></td>
                        <td class="hidden">Fecha de Ultima Visita Proveedor Actual</td>
                        <td class=""> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="hidden form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%>.</textarea>
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                    </tr>

                    <tr>

                        <td colspan="7" class="style58">
                            <div class="panel panel-primary">
                                <a name="c" id="c"></a>
                                <!-- Default panel contents -->
                                <button type="submit" name="guarda_seccion" value="C" class="btn btn-primary btn-lg btn-block" onclick="return validar_c()">Guardar datos Secci&oacute;n C</button>
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
                        <td> <label><!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="cambiaD();"; id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <%//out.print(nombreC);%>
                            </label>
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">D.2</div></td>
                        <td class="style58">Horario de atenci&oacute;n</td>
                        <td><p>&nbsp;</p>
                            <div align="left"><span class="style58">De:</span>
                                <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                                <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                    <%
                                        for (int i = 0; i <= 24; i++) {
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":00")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":00</option>");
                                            out.println("<option ");
                                            if (rset.getString(nombreC).equals(i + ":30")) {
                                                out.println("selected");
                                            }
                                            out.println(">" + i + ":30</option>");
                                        }
                                    %>
                                </select>
                                <%//out.print(nombreC);%>
                                <br />
                                <strong>A:
                                    <!--input name="<%//=nombreC = nomCam + (contCam += 1)%>"  class="form-control" type="text" id="<%//=nombreC%>" size="7" maxlength="7" value="<%//=rset.getString(nombreC)%>"  /-->
                                    <select name="<%=nombreC = nomCam + (contCam += 1)%>"  class="form-control" id="<%=nombreC%>">
                                        <%
                                            for (int i = 0; i <= 24; i++) {
                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":00")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":00</option>");
                                                out.println("<option ");
                                                if (rset.getString(nombreC).equals(i + ":30")) {
                                                    out.println("selected");
                                                }
                                                out.println(">" + i + ":30</option>");
                                            }
                                        %>
                                    </select>
                                    <%//out.print(nombreC);%>
                                </strong>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">D.3</div></td>
                        <td class="style58">Espacio aprox en mts del Almac&eacute;n</td>
                        <td>
                            <label>
                                <label>
                                    <div class="col-sm-6"><input type="text" name="largoAlm" maxlength="4" class="form-control" id="largoAlm" onkeypress="return isNumberKey(event, this);" onkeyup="areaAlm();" value="" /></div>
                                    <div class="col-sm-6"><input type="text" name="anchoAlm" maxlength="4" class="form-control" id="anchoAlm" onkeypress="return isNumberKey(event, this);" onkeyup="areaAlm();" value="" /></div>
                                    <div class="col-sm-12"><input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="8" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" readonly /></div>

                                    <%//out.print(nombreC);%>
                                </label>  
                                <%//out.print(nombreC);%></label>    
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">D.4</div></td>
                        <td class="style58">N&uacute;mero de Anaqueles o Racks en Almacen</td>
                        <td> <label>
                                <input type="text" name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" maxlength="4" class="form-control" id="<%=nombreC%>" name="<%=nombreC%>" onkeypress="return isNumberKey(event, this);" value="<%=rset.getString(nombreC)%>" />
                                <%//out.print(nombreC);%></label>    
                        </td>
                    </tr>
                    <tr>
                        <td class="style58"><div align="center">D.5</div></td>
                        <td class="style58">¿C&oacute;mo surten los Insumos M&eacute;dicos en el Almac&eacute;n?</td>
                        <td> <label><textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
                                <%//out.print(nombreC);%></label>    
                        </td>
                        <td class="style58">&nbsp;</td>
                        <td class="style58"><div align="center">D.6</div></td>
                        <td class="style58">¿Cuentan con &Aacute;rea para carga y descarga en el Almac&eacute;n?</td>
                        <td> <label><!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
                                <%//out.print(nombreC);%></label>    
                        </td>
                    </tr>
                    <tr class="hidden">
                        <td class="hidden"><div align="center">D.7</div></td>
                        <td width="297" class="hidden">Fecha de Ultima Visita Proveedor Actual</td>
                        <td width="369" class="hidden">
                            <label>
                                <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="40" class="hidden form-control" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%>.</textarea>
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
                                <button type="submit" name="guarda_seccion" value="D" class="btn btn-primary btn-lg btn-block" onclick="return validar_d()">Guardar datos Secci&oacute;n D</button>
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
                            <label>  <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="cambiaE();" id="<%=nombreC%>">
                                    <option value="">Seleccione una opción</option>
                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                            out.println("selected");
                                        }%> >Si</option>
                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                            out.println("selected");
                                        }%> >No</option>
                                </select>
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
                                                <!--input type="text" name="<%//=nombreC = nomCam + (contCam += 1)%>" value="<%//=rset.getString(nombreC)%>" id="<%//=nombreC%>" size="3" maxlength="3"  class="form-control" onkeypress="return tabular(event, this)" /-->
                                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                                    <option value="">Seleccione una opción</option>
                                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                            out.println("selected");
                                                        }%> >Si</option>
                                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                            out.println("selected");
                                                        }%> >No</option>
                                                </select>
                                                <strong class="neg">CPU</strong></p>
                                                <%//out.print(nombreC);%>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2">
                                    <div align="center" class="style58">
                                        <div align="center">
                                            <p>
                                                 <!--input type="text" name="<%//=nombreC = nomCam + (contCam += 1)%>" value="<%//=rset.getString(nombreC)%>" id="<%//=nombreC%>" size="3" maxlength="3"  class="form-control" onkeypress="return tabular(event, this)" /-->
                                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                                    <option value="">Seleccione una opción</option>
                                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                            out.println("selected");
                                                        }%> >Si</option>
                                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                            out.println("selected");
                                                        }%> >No</option>
                                                </select>
                                                <strong class="neg">Monitor</strong>           </p>
                                                <%//out.print(nombreC);%>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="2">
                                    <div align="center" class="style58">
                                        <div align="center">
                                            <p>
                                                <!--input type="text" name="<%//=nombreC = nomCam + (contCam += 1)%>" value="<%//=rset.getString(nombreC)%>" id="<%//=nombreC%>" size="3" maxlength="3"  class="form-control" onkeypress="return tabular(event, this)" /-->
                                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                                    <option value="">Seleccione una opción</option>
                                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                            out.println("selected");
                                                        }%> >Si</option>
                                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                            out.println("selected");
                                                        }%> >No</option>
                                                </select>
                                                <strong class="neg">Impresora</strong>                </p>
                                                <%//out.print(nombreC);%>
                                        </div>
                                    </div>
                                </td>
                                <td colspan="3">
                                    <div align="center" class="style58">
                                        <div align="center">
                                            <p>
                                                 <!--input type="text" name="<%//=nombreC = nomCam + (contCam += 1)%>" value="<%//=rset.getString(nombreC)%>" id="<%//=nombreC%>" size="3" maxlength="3"  class="form-control" onkeypress="return tabular(event, this)" /-->
                                                <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                                    <option value="">Seleccione una opción</option>
                                                    <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                            out.println("selected");
                                                        }%> >Si</option>
                                                    <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                            out.println("selected");
                                                        }%> >No</option>
                                                </select>
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
                                    <label> <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                        <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                            <option value="">Seleccione una opción</option>
                                            <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                    out.println("selected");
                                                }%> >Si</option>
                                            <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                    out.println("selected");
                                                }%> >No</option>
                                        </select>
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
                                    <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                    <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" onchange="cambiaTel();" id="<%=nombreC%>">
                                        <option value="">Seleccione una opción</option>
                                        <option value="SI" <% if (rset.getString(nombreC).equals("SI")) {
                                                out.println("selected");
                                            }%> >Si</option>
                                        <option value="NO" <% if (rset.getString(nombreC).equals("NO")) {
                                                out.println("selected");
                                            }%> >No</option>
                                    </select>
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
                                <label> <!--textarea name="<%//=nombreC = nomCam + (contCam += 1)%>" cols="40" class="form-control" id="<%//=nombreC%>" onkeypress="return handleEnter(this, event);" ><%//=rset.getString(nombreC)%></textarea-->
                                    <select class="form-control" name="<%=nombreC = nomCam + (contCam += 1)%>" onkeypress="return handleEnter(this, event);" id="<%=nombreC%>">
                                        <option value="">Seleccione una opción</option>
                                        <option value="NA">NA</option>
                                        <option value="TELCEL" <% if (rset.getString(nombreC).equals("TELCEL")) {
                                                out.println("selected");
                                            }%> >TELCEL</option>
                                        <option value="MOVISTAR" <% if (rset.getString(nombreC).equals("MOVISTAR")) {
                                                out.println("selected");
                                            }%> >MOVISTAR</option>
                                        <option value="IUSACELL" <% if (rset.getString(nombreC).equals("IUSACELL")) {
                                                out.println("selected");
                                            }%> >IUSACELL</option>
                                        <option value="NEXTEL" <% if (rset.getString(nombreC).equals("NEXTEL")) {
                                                out.println("selected");
                                            }%> >NEXTEL</option>
                                        <option value="UNEFON" <% if (rset.getString(nombreC).equals("UNEFON")) {
                                                out.println("selected");
                                            }%> >UNEFON</option>
                                    </select>
                                    <%//out.print(nombreC);%></label> 
                            </td>
                            <td class="style58">&nbsp;</td>
                        </tr>   

                        <td colspan="7" class="style58">
                            <div class="panel panel-primary">
                                <a name="d" id="d"></a>
                                <!-- Default panel contents -->
                                <button type="submit" name="guarda_seccion" value="E" class="btn btn-primary btn-lg btn-block" onclick="return validar_e()">Guardar datos Secci&oacute;n E</button>
                            </div>
                        </td>
                    </tr>   
                    <tr>
                        <td colspan="3" class="style58">
                            <div class="panel panel-primary">
                                <a name="f" id="f"></a>
                                <!-- Default panel contents -->
                                <div class="panel-heading">F.DESCRIBA OBSERVACIONES  Y/O COMENTARIOS GENERALES</div>
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
                                                        <label>  <textarea name="<%=nombreC = nomCam + (contCam += 1)%>" cols="140" rows="10" class="form-control style58" id="<%=nombreC%>" onkeypress="return handleEnter(this, event);" ><%=rset.getString(nombreC)%></textarea>
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
                                    <button type="submit" name="guarda_seccion" value="F" class="btn btn-primary btn-lg btn-block" onclick="return validar_f()">Guardar datos Secci&oacute;n F</button>
                                </div>
                            </td>
                        </tr>


                </form>
                <%
                        }

                    } catch (Exception e) {
                        //out.println("Hola");
                        out.println(e.getMessage());
                    }

                    con.cierraConexion();
                %>
                <%
                    if (ban == 0) {
                        out.println("<script>alert('Se detectó un error al momento de la carga, por favor ingrese nuevamente.')</script>");
                        out.println("<script>window.location='indexCapR.jsp'</script>");
                    }
                %>

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
                                <h4 class="modal-title">INSTRUCCIONES DE LLENADO</h4>
                            </div>
                            <div class="modal-body">
                                <img src="imagenes/GNKL_Small.JPG" />Previamente debes de checar que haya conexi&oacute;n a Internet<br>
                                    <ul>
                                        <li>Ingresa la respuesta del Encuestado en cada uno de sus campos</li>
                                        <li>TODOS los campos deben de ser llenados con su respuesta correspondiente</li>
                                        <li>No se permiten campos vac&iacute;os, en caso de que no haya respuesta v&aacute;lida, poner NA</li>
                                        <li>Por cada Secci&oacute;n de la Encuesta se debe de ir Guardando dando clic en el Bot&oacute;n de GUARDAR</li>
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

                <a href="#" class="scrollup">Scroll</a>
        </table>
    </body>
</html>


<!-- <script type="text/javascript"-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/bootstrap-modal.js"></script>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script language="javascript" src="js/bootstrap-button.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/funcionesBasicas.js"></script>
<script> // este script hace que tabule el enter !!!

                                            function handleEnter(field, event) {
                                                //var miTabla=new elements();
                                                //elements[]={"txtf_ref","txtf_con","txtf_deb"};
                                                var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
                                                if (keyCode === 13) {
                                                    var i;
                                                    for (i = 0; i < field.form.elements.length; i++)
                                                        if (field === field.form.elements[i])
                                                            break;
                                                    i = (i + 1) % field.form.elements.length;
                                                    field.form.elements[i].focus();
                                                    return false;
                                                }
                                                else
                                                    return true;
                                            }
                                            function tabular(e, obj)
                                            {
                                                tecla = (document.all) ? e.keyCode : e.which;
                                                if (tecla != 13)
                                                    return;
                                                frm = obj.form;
                                                for (i = 0; i < frm.elements.length; i++)
                                                    if (frm.elements[i] === obj)
                                                    {
                                                        if (i === frm.elements.length - 1)
                                                            i = -1;
                                                        break
                                                    }
                                                /*ACA ESTA EL CAMBIO*/
                                                if (frm.elements[i + 1].disabled === true)
                                                    tabular(e, frm.elements[i + 1]);
                                                else
                                                    frm.elements[i + 1].focus();
                                                return false;
                                            }

</script>
<script type="text/javascript">
    $(function() {
        $("#campo_46").datepicker();
        $("#campo_46").datepicker('option', {dateFormat: 'dd/mm/yy'});
    });
    function cambiaA() {
        campo = document.getElementById("campo_28").value;
        if (campo === "NO") {
            document.getElementById("campo_29").value = "NA";
            document.getElementById("campo_30").value = "NA";

            document.getElementById("campo_29").readOnly = true;
            document.getElementById("campo_30").readOnly = true;
        }
        if (campo === "SI") {
            document.getElementById("campo_29").value = "";
            document.getElementById("campo_30").value = "";

            document.getElementById("campo_29").readOnly = false;
            document.getElementById("campo_30").readOnly = false;
        }
    }
    function cambiaB() {
        campo = document.getElementById("campo_32").value;
        if (campo === "NO") {
            /*document.getElementById("campo_33").value = "NA";
             document.getElementById("campo_34").value = "NA";*/
            document.getElementById("campo_35").value = "NA";

            /*document.getElementById("campo_33").readOnly = true;
             document.getElementById("campo_34").readOnly = true;*/
            document.getElementById("campo_35").readOnly = true;
        }
        if (campo === "SI") {
            /*document.getElementById("campo_33").value = "";
             document.getElementById("campo_34").value = "";*/
            document.getElementById("campo_35").value = "";

            /*document.getElementById("campo_33").readOnly = false;
             document.getElementById("campo_34").readOnly = false;*/
            document.getElementById("campo_35").readOnly = false;
        }
    }
    function cambiaC() {
        campo = document.getElementById("campo_47").value;
        if (campo === "NO") {

            document.getElementById("campo_48").selectedIndex = 2;
            document.getElementById("campo_49").selectedIndex = 0;
            document.getElementById("campo_50").selectedIndex = 0;
            document.getElementById("campo_54").selectedIndex = 2;

            document.getElementById("campo_51").value = "NA";
            document.getElementById("campo_52").value = "NA";
            document.getElementById("campo_53").value = "NA";

            document.getElementById("campo_51").readOnly = true;
            document.getElementById("campo_52").readOnly = true;
            document.getElementById("campo_53").readOnly = true;
        }
        if (campo === "SI") {
            document.getElementById("campo_51").value = "";
            document.getElementById("campo_52").value = "";
            document.getElementById("campo_53").value = "";

            document.getElementById("campo_51").readOnly = false;
            document.getElementById("campo_52").readOnly = false;
            //document.getElementById("campo_53").readOnly = false;
        }
    }

    function cambiaD() {
        campo = document.getElementById("campo_56").value;
        if (campo === "NO") {

            document.getElementById("campo_57").selectedIndex = 0;
            document.getElementById("campo_58").selectedIndex = 0;
            document.getElementById("campo_62").selectedIndex = 2;

            document.getElementById("campo_59").value = "NA";
            document.getElementById("campo_60").value = "NA";
            document.getElementById("campo_61").value = "NA";

            document.getElementById("campo_59").readOnly = true;
            document.getElementById("campo_60").readOnly = true;
            document.getElementById("campo_61").readOnly = true;
        }
        if (campo === "SI") {
            document.getElementById("campo_59").value = "";
            document.getElementById("campo_60").value = "";
            document.getElementById("campo_61").value = "";

            //document.getElementById("campo_59").readOnly = false;
            document.getElementById("campo_60").readOnly = false;
            document.getElementById("campo_61").readOnly = false;
        }
    }
    function cambiaE() {
        campo = document.getElementById("campo_64").value;
        if (campo === "NO") {

            document.getElementById("campo_65").selectedIndex = 2;
            document.getElementById("campo_66").selectedIndex = 2;
            document.getElementById("campo_67").selectedIndex = 2;
            document.getElementById("campo_68").selectedIndex = 2;

        }
        if (campo === "SI") {
        }
    }

    function cambiaTel() {
        campo = document.getElementById("campo_70").value;
        if (campo === "NO") {
            document.getElementById("campo_71").selectedIndex = 1;
        }
        if (campo === "SI") {
        }
    }
    function validar_a() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 1; i <= 31; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección A esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_b() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 32; i <= 46; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección B esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_c() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 47; i <= 55; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección C esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_d() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 56; i <= 63; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección D esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_e() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 64; i <= 71; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección E esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_f() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 72; i <= 72; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección F esta vacío");
                return false;
            }
        }

        return true;
    }

    function validar_g() {
        //obteniendo el valor que se puso en campo text del formulario
        for (i = 151; i <= 151; i++) {
            miCampoTexto = document.getElementById("campo_" + i).value;
            //la condición
            if (miCampoTexto.length === 0) {
                alert("El campo número " + i + " de la sección G esta vacío");
                return false;
            }
        }

        return true;
    }
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#form').submit(function() {

            //alert("Ingresó");
            return false;
        });
        $('#btn_mos').click(function() {
            var id = $('#slct_censo').val();
            //alert("id: "+id);
            var dir = 'consultaCensos.jsp?id=' + id;
            $.ajax({
                url: dir,
                type: 'json',
                success: function(data) {
                    // alert("success");
                    json = JSON.parse(data);
                    var nomCon = "textarea#campo_";
                    var nombreControl = "", nombreJson = "";
                    var contNom = 1;
                    var nomJson = "json_";

                    while (contNom < 196) {
                        nombreControl = nomCon + contNom;
                        nombreJson = nomJson + contNom;
                        // alert(nombreControl=nomCon+contNom);
                        // alert(nombreJson=nomJson+contNom);
                        $(nombreControl).val(json[nombreJson]);
                        contNom++;
                    }
                    //$("input#txtf_aa").val(json["json_1"]); 
                    //$("input#txtf_elab").val(json["json_75"]);
                    //$("input#ima").val(json["json_9"]);


                    var image = $('#imagen');
                    var image2 = $('#imagen2');
                    var image3 = $('#imagen3');
                    var image4 = $('#imagen4');
                    var image5 = $('#imagen5');
                    var image6 = $('#imagen6');
                    var image7 = $('#imagen7');

                    var ruta = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_1.JPG";
                    var ruta2 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_2.JPG";
                    var ruta3 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_3.JPG";
                    var ruta4 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_4.JPG";
                    var ruta5 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_5.JPG";
                    var ruta6 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_6.JPG";
                    var ruta7 = "imagenes/" + json["json_9"] + "/" + json["json_9"] + "_7.JPG";

                    //$(".carousel-inner .item img").attr("src", "imagenes/" + id); 
                    //alert(ruta);
                    image.attr("src", ruta);
                    image2.attr("src", ruta2);
                    image3.attr("src", ruta3);
                    image4.attr("src", ruta4);
                    image5.attr("src", ruta5);
                    image6.attr("src", ruta6);
                    image7.attr("src", ruta7);

                },
            });
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

    });
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
<script type="text/javascript">
    $(function() {
        $(".popover-examples a").popover({
            title: 'Default title value'
        });
    });
</script>
