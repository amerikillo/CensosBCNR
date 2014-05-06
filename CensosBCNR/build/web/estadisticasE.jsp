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
                /*#datos {font-size: 12px;}
                #tabla {width: 800px;}*/
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
                        <li class=""><a href="estadisticasC.jsp">Sección C - FARMACIA</a></li>
                        <li class=""><a href="estadisticasD.jsp">Sección D - ALMACÉN</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasD.jsp">Sección E - EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA</a></li>
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#a1"><small>-Equipo de Cómputo</small></a></li>
                            <li class="list-group-item"><a href="#a2"><small>-Internet</small></a></li>
                            <li class="list-group-item"><a href="#a3"><small>-Telefonía Celular</small></a></li>
                            <li class="list-group-item"><a href="#a4"><small>-Datos</small></a></li>
                        </ul>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">E. EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>

                    <h4 class="page-header">Equipo de cómputo</h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-12"></div>
                    </div>


                    <div class="row placeholders">
                        <div id="e2" class="col-lg-4"></div>
                        <div id="e3" class="col-lg-4"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e4" class="col-lg-6"></div>
                        <div id="e5" class="col-lg-6"></div>
                    </div>
                    <a name="a2"></a>
                    <h4 class="page-header">Internet</h4>
                    <div class="row placeholders">
                        <div id="e6" class="col-lg-8"></div>
                    </div>
                    <a name="a3"></a>
                    <h4 class="page-header">Telefonía Celular</h4>
                    <div class="row placeholders">
                        <div id="e7" class="col-lg-8"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e8" class="col-lg-6"></div>
                    </div>

                    <a name="a4"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Eq. Cómputo</th>
                                    <th>CPU</th>
                                    <th>Monitor</th>
                                    <th>Impresora</th>
                                    <th>No-Break</th>
                                    <th>Internet</th>
                                    <th>Señal Celular</th>
                                    <th>Compañía</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.campo_1, e.* FROM tb_a a, tb_e e where a.id_uni = e.id_uni and a.campo_31!='';");
                                        while (rset.next()) {
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
                                    <td><%=rset.getString(5)%></td>
                                    <td><%=rset.getString(6)%></td>
                                    <td><%=rset.getString(7)%></td>
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
                    text: 'Total de U.A. con y sin equipo de cómputo'
                },
                tooltip: {
                    pointFormat: 'Tienen computadora: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen computadora</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_64,count(campo_64) from tb_e where campo_64 != '' GROUP BY campo_64 ;");
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


            /*
             $('#e2').highcharts({
             chart: {
             plotBackgroundColor: null,
             plotBorderWidth: null,
             plotShadow: false
             },
             title: {
             text: 'Total de U.A. con y sin CPU'
             },
             tooltip: {
             pointFormat: 'Tienen CPU: {point.y} Unidades'
             },
             plotOptions: {
             pie: {
             allowPointSelect: true,
             cursor: 'pointer',
             dataLabels: {
             enabled: true,
             color: '#000000',
             connectorColor: '#000000',
             format: '<b>{point.name} tienen CPU</b>: {point.percentage:.1f} %'
             }
             }
             },
             series: [{
             type: 'pie',
             name: 'Total',
             data: [
        <%  //                             try {
                 //con.conectar();
                 // ResultSet rset = con.consulta("select campo_65,count(campo_65) from tb_e where campo_64 = 'SI' GROUP BY campo_65 ;");
                 // while (rset.next()) {
        %>
             ['<%//=rset.getString(1)%>', <%//=rset.getString(2)%>],
        <%
                 // }
                 //  con.cierraConexion();
                 //   } catch (Exception e) {
                 //  }
        %>
             
             ]
             }]
             });*/

            /*
             $('#e3').highcharts({
             chart: {
             plotBackgroundColor: null,
             plotBorderWidth: null,
             plotShadow: false
             },
             title: {
             text: 'Total de U.A. con y sin Monitor'
             },
             tooltip: {
             pointFormat: 'Tienen Monitor: {point.y} Unidades'
             },
             plotOptions: {
             pie: {
             allowPointSelect: true,
             cursor: 'pointer',
             dataLabels: {
             enabled: true,
             color: '#000000',
             connectorColor: '#000000',
             format: '<b>{point.name} tienen Monitor</b>: {point.percentage:.1f} %'
             }
             }
             },
             series: [{
             type: 'pie',
             name: 'Total',
             data: [
             <%    //                            try {
            //  con.conectar();
            //  ResultSet rset = con.consulta("select campo_66,count(campo_66) from tb_e where campo_64 = 'SI' GROUP BY campo_66 ;");
            //   while (rset.next()) {
        %>
             ['<%//=rset.getString(1)%>', <%//=rset.getString(2)%>],
             <%
            //     }
            //      con.cierraConexion();
            //   } catch (Exception e) {
            //  }
        %>
             
             ]
             }]
             });*/



            $('#e4').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total de U.A. con y sin Impresora'
                },
                tooltip: {
                    pointFormat: 'Tienen Impresora: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen Impresora</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_67,count(campo_67) from tb_e where campo_64 = 'SI' GROUP BY campo_67 ;");
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


            $('#e5').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total de U.A. con y sin No-Break'
                },
                tooltip: {
                    pointFormat: 'Tienen no-Break: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen no-Break</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_68,count(campo_68) from tb_e where campo_64 = 'SI' GROUP BY campo_68 ;");
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


            $('#e6').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total de U.A. con y sin conexión a internet'
                },
                tooltip: {
                    pointFormat: 'Tienen Internet: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen Internet</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_69,count(campo_69) from tb_e where campo_69 != '' GROUP BY campo_69 ;");
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


            $('#e7').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'Total de U.A. con y sin telefonía celular'
                },
                tooltip: {
                    pointFormat: 'Tienen señal celular: {point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name} tienen señal celular</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_70,count(campo_70) from tb_e where campo_70 != '' GROUP BY campo_70 ;");
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


            $('#e8').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Señal Celular'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Señal Celular'
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
                    pointFormat: 'se encuentra en: <b>{point.y} Unidad(es)</b>',
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
                ResultSet rset = con.consulta("select campo_71,count(campo_71) from tb_e where campo_71!='' and campo_71!= 'NA' and campo_71!= 'N/A' GROUP BY campo_71 order by campo_71+0;");
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
