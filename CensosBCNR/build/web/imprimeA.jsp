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
        response.sendRedirect("index.jsp");
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

            #datos {font-size: 9px;}
            #tabla {width: 800px;}
            #principal{float: left;}
            #navi {display:none;}
            #cont {display:none;}

        </style>
    </head>
    <body>
        <!--canvas id="canvas" width="600px" height="400px"-->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="display:none;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Estadísticas de Censos Rurales</a>

                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class=""><a href="indexMain.jsp">Men&uacute;</a></li>
                        <li class=""><a href="consultaCensosR.jsp">Censos</a></li>
                        <li class=""><a href="http://166.78.128.202:8080/InventariosChiapas/index.jsp">Inventarios</a></li>
                        <!--li><a data-toggle="modal" href="#myModal2">Instrucciones</a></li>
                        <li><a data-toggle="modal" href="#myModal">Sistemas</a></li-->
                        <li class="active"><A HREF="javascript:window.print()">Imprimir</A></li>
                        <li class=""><A HREF="exportarExcel.jsp">Exportar Información</A></li>
                        <li><a href="index.jsp">Salir</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid" >
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar"  style="display:none;">
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                        <div>
                            <ul class="list-group">
                                <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                                <li class="list-group-item"><a href="#a2"><small>-Población</small></a></li>
                                <li class="list-group-item"><a href="#a3"><small>-Personal y Contacto</small></a></li>
                                <li class="list-group-item"><a href="#a4"><small>-Médicos y Enfermeras</small></a></li>
                                <li class="list-group-item"><a href="#a5"><small>-Módulos y Servicios</small></a></li>
                                <li class="list-group-item"><a href="#a6"><small>-Tiempo Laboral</small></a></li>
                                <li class="list-group-item"><a href="#a7"><small>-Climatológico</small></a></li>
                                <li class="list-group-item"><a href="#a8"><small>-Datos</small></a></li>
                            </ul>
                        </div>
                        <li class=""><a href="estadisticasB.jsp">Sección B - TAREAS OPERACIONALES</a></li>
                        <li class=""><a href="estadisticasC.jsp">Sección C - FARMACIA</a></li>
                        <li class=""><a href="estadisticasD.jsp">Sección D - ALMACÉN</a></li>
                        <li class=""><a href="estadisticasE.jsp">Sección E - EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-left:0px">
                    <a name="a1"></a>
                    <h1 class="page-header">A. DATOS GENERALES</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                        <div id="e2" class="col-lg-6"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e4" class="col-lg-12"></div>
                    </div>
                    <a name="a2"></a>
                    <h4 class="page-header">Población</h4>
                    <div class="row placeholders">
                        <div id="e9" class="col-lg-12"></div>
                    </div>
                    <a name="a3"></a>
                    <h4 class="page-header">Personal y Contacto</h4>

                    <div class="row placeholders">
                        <div id="e5" class="col-lg-6"></div>
                        <div id="e6" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e7" class="col-lg-6"></div>
                        <div id="e8" class="col-lg-6"></div>
                    </div>

                    <a name="a4"></a>
                    <h4 class="page-header">Médicos y Enfermeras</h4>

                    <div class="row placeholders">
                        <div id="e10" class="col-lg-6"></div>
                        <div id="e11" class="col-lg-6"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e12" class="col-lg-8"></div>
                    </div>


                    <a name="a5"></a>
                    <h4 class="page-header">Módulos y Servicios</h4>

                    <div class="row placeholders">
                        <div id="e3" class="col-lg-10"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e15" class="col-lg-10"></div>
                    </div>


                    <a name="a6"></a>
                    <h4 class="page-header">Tiempo Laboral</h4>
                    <div class="row placeholders">
                        <div id="e13" class="col-lg-6"></div>
                        <div id="e14" class="col-lg-6"></div>
                    </div>

                    <a name="a7"></a>
                    <h4 class="page-header">Climatológico</h4>
                    <div class="row placeholders">
                        <div id="e16" class="col-lg-6"></div>
                    </div>

                    <a name="a8"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Juris</th>
                                    <th>Mpio.</th>
                                    <th>No. Mod.</th>
                                    <th>Tipo</th>
                                    <th>Responsable</th>
                                    <th>Tel.</th>
                                    <th>eMail</th>
                                    <th>Odontólogo</th>
                                    <th>Pob. A.</th>
                                    <th>Med. Base</th>
                                    <th>MPSS</th>
                                    <th>No Enfermeras</th>
                                    <th>Hor. Atn.</th>
                                    <th>Días Lab.</th>
                                    <th>No. Ser.</th>
                                    <th>Clima</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.* FROM tb_a a where a.campo_31!='' order by a.id_uni+0;");
                                        while (rset.next()) {
                                            String[] result = rset.getString(12).split(" ");
                                            String juris = result[2];
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><small><%=rset.getString(2)%></small></td>
                                    <td><small>J.S. <%=juris%></small></td>
                                    <td><small><%=rset.getString(14)%></small></td>
                                    <td><small><%=rset.getString(15)%></small></td>
                                    <td><small><%=rset.getString(16)%></small></td>
                                    <td><small><%=rset.getString(17)%></small></td>
                                    <td><small><%=rset.getString(18)%></small></td>
                                    <td><small><%=rset.getString(19)%></small></td>
                                    <td><small><%=rset.getString(20)%></small></td>
                                    <td><small><%=rset.getString(21)%></small></td>
                                    <td><small><%=rset.getString(22)%></small></td>
                                    <td><small><%=rset.getString(24)%></small></td>
                                    <td><small><%=rset.getString(25)%></small></td>
                                    <td><small><%=rset.getString(26)%> - <%=rset.getString(27)%></small></td>
                                    <td><small><%=rset.getString(28)%></small></td>
                                    <td><small><%=rset.getString(30)%></small></td>
                                    <td><small><%=rset.getString(32)%></small></td>
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

        <!--/canvas-->
    </body>
    <!-- JAVASCRIPT -->
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/highcharts.js"></script>
    <script src="js/modules/exporting.js"></script>

    <script>

                function imagen(){
                html2canvas(document.body, {
                onrendered: function(canvas) {
                document.body.appendChild(canvas);
                }
                });
                }

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
                text: 'Totales por Jurisdicción'
                },
                tooltip: {
                pointFormat: '{point.y} Unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_11, count(campo_11) from tb_a where campo_31!='' group by campo_11;");
                while (rset.next()) {
                    String[] result = rset.getString(1).split(" ");
                    String juris = result[2];
        %>
                        ['J.S. <%=juris%>', <%=rset.getString(2)%>],
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
                text: 'Totales por Municipio'
                },
                tooltip: {
                pointFormat: '{point.y} Unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_13, count(campo_13) from tb_a where campo_31!='' group by campo_13;");
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
        plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
        },
                title: {
                text: 'Escala de módulos'
                },
                tooltip: {
                pointFormat: '{point.y} módulo(s)'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '{point.name}: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_14, count(campo_14), (campo_14*count(campo_14)) as total from tb_a where campo_14 not in ('NA', 'N/A','0') and campo_31!='' group by campo_14 ;");
                while (rset.next()) {
        %>
                        ['<%=rset.getString(2)%> UA con <%=rset.getString(1)%> módulo(s)', <%=rset.getString(3)%>],
        <%
            }
            rset = con.consulta("SELECT campo_14, count(campo_14) from tb_a where campo_14 ='NA' or campo_14='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        //['0', <%=rset.getString(2)%>],
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
        type: 'bar'
        },
                title: {
                text: 'Totales por tipo de U.A. censada'
                },
                tooltip: {
                pointFormat: '<b>{point.y} Unidades</b>',
                },
                legend: {
                enabled: false
                },
                xAxis: {
                categories: [],
                        title: {
                        text: null
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
                plotOptions: {
                bar: {
                dataLabels: {
                enabled: true
                }
                }
                },
                credits: {
                enabled: false
                },
                series: [{
                type: 'bar',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_15, count(campo_15) from tb_a where campo_31!='' group by campo_15;");
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
                text: 'Totales con y sin responsable'
                },
                tooltip: {
                pointFormat: '{point.y} Unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_16, count(campo_16) from tb_a where campo_16 not in ('NA', 'N/A') and campo_31!='' ;");
                while (rset.next()) {
        %>
                        ['Con Responsable', <%=rset.getString(2)%>],
        <%
            }
            rset = con.consulta("SELECT campo_16, count(campo_16) from tb_a where campo_16 ='NA' or campo_16='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        ['Sin Responsable', <%=rset.getString(2)%>],
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
                text: 'Total de U.A. con y sin teléfono'
                },
                tooltip: {
                pointFormat: '{point.y} Unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_17, count(campo_17) from tb_a where campo_17 not in ('NA', 'N/A') and campo_31!='' ;");
                while (rset.next()) {
        %>
                        ['Con Teléfono', <%=rset.getString(2)%>],
        <%
            }
            rset = con.consulta("SELECT campo_17, count(campo_17) from tb_a where campo_17 ='NA' or campo_17='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        ['Sin Teléfono', <%=rset.getString(2)%>],
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
                text: 'Total de U.A. con y sin correo electrónico'
                },
                tooltip: {
                pointFormat: '{point.y} Unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_18, count(campo_18) from tb_a where campo_18 not in ('NA', 'N/A') and campo_31!='' ;");
                while (rset.next()) {
        %>
                        ['Con Email', <%=rset.getString(2)%>],
        <%
            }
            rset = con.consulta("SELECT campo_18, count(campo_18) from tb_a where campo_18 ='NA' or campo_18='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        ['Sin Email', <%=rset.getString(2)%>],
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
        plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
        },
                title: {
                text: 'Total de U.A. con y sin odontólogo'
                },
                tooltip: {
                pointFormat: '{point.y} Unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_19, count(campo_19) from tb_a where campo_19 not in ('NA', 'N/A') and campo_31!='' ;");
                while (rset.next()) {
        %>
                        ['Con Odontólogo', <%=rset.getString(2)%>],
        <%
            }
            rset = con.consulta("SELECT campo_19, count(campo_19) from tb_a where campo_19 ='NA' or campo_19='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        ['Sin Odontólogo', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                        ]
                }]
        });
                $('#e9').highcharts({
        chart: {
        type: 'bar'
        },
                title: {
                text: 'Rangos de población atendida'
                },
                tooltip: {
                pointFormat: '<b>{point.y} Unidades</b>',
                },
                legend: {
                enabled: false
                },
                xAxis: {
                categories: [],
                        title: {
                        text: null
                        }
                },
                yAxis: {
                min: 0,
                        title: {
                        text: 'Población Atendida',
                                align: 'high'
                        },
                        labels: {
                        overflow: 'justify'
                        }
                },
                plotOptions: {
                bar: {
                dataLabels: {
                enabled: true
                }
                }
                },
                credits: {
                enabled: false
                },
                series: [{
                type: 'bar',
                        name: 'Población Atendida',
                        data: [
        <%
            try {
                con.conectar();
                int r1 = 0, r2 = 0, r3 = 0, r4 = 0, r5 = 0, r6 = 0, r7 = 0;
                ResultSet rset = con.consulta("SELECT campo_20, count(campo_20) from tb_a where campo_20 not in ('NA', 'N/A') and campo_31!='' group by campo_20 ;");
                while (rset.next()) {
                    try {

                        String[] result = rset.getString(1).split(",");
                        /*System.out.println("+++"+result.length);
                         System.out.println("***"+result[0]);
                         System.out.println("---"+result[1]);
                         System.out.println(result[0] + result[1]);*/
                        int total = Integer.parseInt((result[0]));
                        if (result.length > 1) {
                            total = Integer.parseInt((result[0] + result[1]));
                        }
                        System.out.println("---" + total);

                        if (total >= 1 && total <= 500) {
                            r1++;
                        }
                        if (total >= 501 && total <= 1000) {
                            r2++;
                        }
                        if (total >= 1001 && total <= 2500) {
                            r3++;
                        }
                        if (total >= 2501 && total <= 5000) {
                            r4++;
                        }
                        if (total >= 5001 && total <= 10000) {
                            r5++;
                        }
                        if (total >= 10001 && total <= 25000) {
                            r6++;
                        }
                        if (total >= 25001 && total <= 50000) {
                            r7++;
                        }
                    } catch (Exception e) {
                    }
                }
        %>
                        ['1 a 500', <%=r1%>],
                                ['501 a 1,000', <%=r2%>],
                                ['1,001 a 2,500', <%=r3%>],
                                ['2,501 a 5,000', <%=r4%>],
                                ['5,001 a 10,000', <%=r5%>],
                                ['10,001 a 25,000', <%=r6%>],
                                ['25,001 a 50,000', <%=r7%>],
        <%
            rset = con.consulta("SELECT campo_20, count(campo_20) from tb_a where campo_20 ='NA' or campo_19='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        //['NA', <%=rset.getString(2)%>]
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
                $('#e10').highcharts({
        chart: {
        plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
        },
                title: {
                text: 'Rangos de médicos de base'

                },
                subtitle: {
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_21, sum(campo_21) from tb_a where campo_21 not in ('NA', 'N/A', 'NO HA') and campo_31!='' ;");
                while (rset.next()) {
        %>
                text: 'Total de médicos de base: <%=rset.getString(2)%>',
                        x: - 20
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                },
                tooltip: {
                pointFormat: '{point.y} Médico(s)'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '{point.name} : {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_21, count(campo_21), (campo_21*count(campo_21)) as total from tb_a where campo_21 not in ('NA', 'N/A', 'NO HA','0') and campo_31!='' group by campo_21 ;");
                while (rset.next()) {
        %>
                        ['<%=rset.getString(2)%> UA con <%=rset.getString(1)%> médico(s)', <%=rset.getString(3)%>],
        <%
            }
            rset = con.consulta("SELECT campo_21, count(campo_21) from tb_a where campo_21 ='NA' or campo_21='N/A' or campo_21='NO HA' or campo_21 = '0' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        //['0', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                        ]
                }]
        });
                $('#e11').highcharts({
        chart: {
        plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
        },
                title: {
                text: 'Rangos de médicos pasantes'
                },
                subtitle: {
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_23, sum(campo_23) from tb_a where campo_23 not in ('NA', 'N/A', 'NO HA') and campo_23!='' ;");
                while (rset.next()) {
        %>
                text: 'Total de médicos pasantes: <%=rset.getString(2)%>',
                        x: - 20
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                },
                tooltip: {
                pointFormat: '{point.y} MPSS'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '{point.name} : {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_23, count(campo_23), (campo_23*count(campo_23)) as total  from tb_a where campo_23 not in ('NA', 'N/A', 'NO HA') and campo_31!='' group by campo_23 ;");
                while (rset.next()) {
        %>
                        ['<%=rset.getString(2)%> UA con <%=rset.getString(1)%> MPSS', <%=rset.getString(3)%>],
        <%
            }
            rset = con.consulta("SELECT campo_23, count(campo_23) from tb_a where campo_23 ='NA' or campo_23='N/A' or campo_23='NO HA' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        //['0', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                        ]
                }]
        });
                $('#e12').highcharts({
        chart: {
        plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
        },
                title: {
                text: 'Rangos de enfermeras'
                },
                subtitle: {
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_24, sum(campo_24) from tb_a where campo_24 not in ('NA', 'N/A', 'NO HA') and campo_24!='' ;");
                while (rset.next()) {
        %>
                text: 'Total de enfermeras: <%=rset.getString(2)%>',
                        x: - 20
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                },
                tooltip: {
                pointFormat: '{point.y} Enfermera(s)'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '{point.name} : {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_24, count(campo_24), (campo_24*count(campo_24)) as total  from tb_a where campo_24 not in ('NA', 'N/A', 'NO HA') and campo_31!='' group by campo_24 ;");
                while (rset.next()) {
        %>
                        ['<%=rset.getString(2)%> UA con <%=rset.getString(1)%> Enfermera(s)', <%=rset.getString(3)%>],
        <%
            }
            rset = con.consulta("SELECT campo_24, count(campo_24) from tb_a where campo_24 ='NA' or campo_24='N/A' or campo_24='NO HA' and campo_31!='' ;");
            while (rset.next()) {
        %>
                        //['0', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                        ]
                }]
        });
                $('#e13').highcharts({
        chart: {
        plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
        },
                title: {
                text: 'Rangos de horarios de atención'
                },
                tooltip: {
                pointFormat: 'horario en {point.y} unidades'
                },
                plotOptions: {
                pie: {
                allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                        enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                }
                },
                series: [{
                type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_25, campo_26, count(id_uni) from tb_a where campo_31!='' group by campo_25, campo_26;");
                while (rset.next()) {
        %>
                        ['<%=rset.getString(1)%> - <%=rset.getString(2)%>', <%=rset.getString(3)%>],
        <%
                }

                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                                            ]
                                    }]
                            });
                                    $('#e14').highcharts({
                            chart: {
                            plotBackgroundColor: null,
                                    plotBorderWidth: null,
                                    plotShadow: false
                            },
                                    title: {
                                    text: 'Rangos de días laborables'
                                    },
                                    tooltip: {
                                    pointFormat: 'días laborales en {point.y} unidades'
                                    },
                                    plotOptions: {
                                    pie: {
                                    allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                            enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                                            }
                                    }
                                    },
                                    series: [{
                                    type: 'pie',
                                            name: 'Total',
                                            data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_27, count(campo_27) from tb_a where campo_31!='' group by campo_27;");
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
                                    $('#e15').highcharts({
                            chart: {
                            plotBackgroundColor: null,
                                    plotBorderWidth: null,
                                    plotShadow: false
                            },
                                    title: {
                                    text: 'Escala de no. de servicios'
                                    },
                                    tooltip: {
                                    pointFormat: '{point.y} Servicio(s)'
                                    },
                                    plotOptions: {
                                    pie: {
                                    allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                            enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '{point.name}: {point.percentage:.1f} %'
                                            }
                                    }
                                    },
                                    series: [{
                                    type: 'pie',
                                            name: 'Total',
                                            data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_29, count(campo_29), (campo_29*count(campo_29)) from tb_a where campo_29 not in ('NA', 'N/A') and campo_31!='' group by campo_29 ;");
                while (rset.next()) {
        %>
                                            ['<%=rset.getString(2)%> UA con <%=rset.getString(1)%> Servicio(s)', <%=rset.getString(3)%>],
        <%
            }
            rset = con.consulta("SELECT campo_29, count(campo_29) from tb_a where campo_29 ='NA' or campo_29='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                                            //['0', <%=rset.getString(2)%>],
        <%
                }
                con.cierraConexion();
            } catch (Exception e) {
            }
        %>
                                            ]
                                    }]
                            });
                                    $('#e16').highcharts({
                            chart: {
                            plotBackgroundColor: null,
                                    plotBorderWidth: null,
                                    plotShadow: false
                            },
                                    title: {
                                    text: 'Rangos de climas predominantes'
                                    },
                                    tooltip: {
                                    pointFormat: 'clima en {point.y} unidades'
                                    },
                                    plotOptions: {
                                    pie: {
                                    allowPointSelect: true,
                                            cursor: 'pointer',
                                            dataLabels: {
                                            enabled: true,
                                                    color: '#000000',
                                                    connectorColor: '#000000',
                                                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                                            }
                                    }
                                    },
                                    series: [{
                                    type: 'pie',
                                            name: 'Total',
                                            data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT campo_31, count(campo_31) from tb_a where campo_31 not in ('NA', 'N/A') and campo_31!='' group by campo_31 ;");
                while (rset.next()) {
        %>
                                            ['<%=rset.getString(1)%>', <%=rset.getString(2)%>],
        <%
            }
            rset = con.consulta("SELECT campo_31, count(campo_31) from tb_a where campo_31 ='NA' or campo_31='N/A' and campo_31!='' ;");
            while (rset.next()) {
        %>
                                            //['NA', <%=rset.getString(2)%>],
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
