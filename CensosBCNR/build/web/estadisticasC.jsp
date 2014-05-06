<%-- 
    Document   : estadisticasE
    Created on : 24-mar-2014, 12:41:21
    Author     : Americo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>
<%@ page import="clasesJava.*" %>
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
    int tam_cen = 0;
    ConectionDB con = new ConectionDB();
    ClasesProc objR = new ClasesProc();
    tam_cen = objR.regresaCont();


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estadísticas de Censos Rurales</title>
        <!--Estilos de BootStrap-->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <link href="css/dashboard.css" rel="stylesheet" />
        <!---->
        <style type="text/css" media="print">
            @media print {
                #datos {font-size: 11px;}
                #tabla {width: 800px;}
                #principal{margin-left: 0px;}
                #navi {display:none;}
                #cont {display:none;}
            }
        </style>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="navi">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Estadísticas 1er Nivel</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class=""><a href="indexSelec.html">Men&uacute;</a></li>
                        <li class=""><a href="http://166.78.128.202:8080/CensosBCNH/consultaCensosH.jsp">Censos Hospitales</a></li>
                        <li class=""><a href="consultaCensosR.jsp">Censos 1er Nivel</a></li>
                        <li class=""><a href="consultaJuris.jsp">Censos Jurisdicciones</a></li>
                        <li class=""><a href="consultaJuris.jsp">Entrevistas Jurisdicciones</a></li>
                        <!--li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                        <li><a data-toggle="modal" href="#myModal">Sistemas</a></li-->
                        <li class="active"><A HREF="javascript:window.print()">Imprimir</A></li>
                        <li class=""><A HREF="exportarExcel.jsp">Exportar Información</A></li>
                        <li><a href="index.jsp">Salir</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar" id="cont">
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                        <li class=""><a href="estadisticasB.jsp">Sección B - TAREAS OPERACIONALES</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasC.jsp">Sección C - FARMACIA</a></li>
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                            <li class="list-group-item"><a href="#a2"><small>-Espacio y almacenamiento</small></a></li>
                            <li class="list-group-item"><a href="#a3"><small>-Red Fría</small></a></li>
                            <li class="list-group-item"><a href="#a4"><small>-Datos</small></a></li>
                        </ul>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasD.jsp">Sección D - ALMACÉN</a></li>
                        <li class=""><a href="estadisticasE.jsp">Sección E - EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">C. FARMACIA</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                        <div id="e2" class="col-lg-6"></div>
                    </div>
                    <a name="a2"></a>
                    <h4 class="page-header">Espacio y almacenamiento</h4>
                    <div class="row placeholders">
                        <div id="e4" class="col-lg-6"></div>
                        <div id="e3" class="col-lg-6"></div>
                    </div>
                    <a name="a3"></a>
                    <h4 class="page-header">Red Fría</h4>
                    <div class="row placeholders">
                        <div id="e5" class="col-lg-6"></div>
                    </div>
                    <a name="a4"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Farmacia</th>
                                    <th>Controlados</th>
                                    <th>Farmacia m2</th>
                                    <th>Anaqueles</th>
                                    <th>Red Fría</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.campo_1, c.* FROM tb_a a, tb_c c where a.id_uni = c.id_uni and a.campo_31!='';");
                                        while (rset.next()) {
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
                                    <td><%=rset.getString(8)%></td>
                                    <td><%=rset.getString(9)%></td>
                                    <td><%=rset.getString(10)%></td>
                                </tr>
                                <%
                                        }
                                        con.cierraConexion();
                                    } catch (Exception e) {
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!-- JAVASCRIPT -->
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/highcharts.js"></script>
    <script src="js/modules/exporting.js"></script>
    <script type="text/javascript">
        $(function() {
            Highcharts.setOptions({
                colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
            });
            $('#e1').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total de U.A. con y sin farmacia'
                },
                tooltip: {
                    pointFormat: 'Tienen farmacia: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen farmacia</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_56,count(campo_56) from tb_d where campo_56 != '' GROUP BY campo_56 ;");
                while (rset.next()) {
        %>
                            ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                        ]
                    }]
            });


            $('#e2').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Totales U.A. con y sin controlados'
                },
                tooltip: {
                    pointFormat: 'Manejan Controlado: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} manejan controlados</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_48,count(campo_48) from tb_c where campo_48 != '' GROUP BY campo_48 ;");
                while (rset.next()) {
        %>
                            ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                        ]
                    }]
            });


            $('#e3').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'C.5 Rangos de no. de anaqueles'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Cantidad de Anaqueles'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Unidades',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'anaqueles en: <b>{point.y} Unidades</b>',
                },
                        /*plotOptions: {
                         bar: {
                         dataLabels: {
                         enabled: true
                         }
                         }
                         },*/
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_52,count(campo_52) from tb_c where campo_52!='' and campo_52!= 'NA' and campo_52!= 'N/A' GROUP BY campo_52 order by campo_52+0;");
                while (rset.next()) {
        %>
                                    ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });



            $('#e4').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'C.6 Espacio aprox en mts2 de la Farmacia'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Espacio en m2'
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'No. de Unidades',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'm2 en: <b>{point.y} Unidades</b>',
                },
                        /*plotOptions: {
                         bar: {
                         dataLabels: {
                         enabled: true
                         }
                         }
                         },*/
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select SUBSTRING_INDEX(campo_53,'=',-1),count(SUBSTRING_INDEX(campo_53,'=',-1)) from tb_c where campo_53!='' and campo_53!= 'NA' and campo_53!= 'N/A' GROUP BY SUBSTRING_INDEX(campo_53,'=',-1) order by SUBSTRING_INDEX(campo_53,'=',-1)+0;");
                while (rset.next()) {
                    String area = rset.getString(1);
                    try {
                        String medi[] = rset.getString(1).split("=");
                        area = medi[1];
                    } catch (Exception e) {
                    }
                    System.out.println("----" + area + "****");

        %>
                                    ['<%=area%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        %>

                                ]
                            }]
            });


            $('#e5').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total de U.A. con y sin red fría'
                },
                tooltip: {
                    pointFormat: 'Manejan red Fría: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} Tienen</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_54,count(campo_54) from tb_c where campo_54 != '' GROUP BY campo_54 ;");
                while (rset.next()) {
        %>
                            ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>

                        ]
                    }]
            });

        });


    </script>
</html>
