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
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 col-md-2 sidebar" id="cont">
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasA.jsp">Sección A - DATOS GENERALES</a></li>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class="active"><a href="estadisticasB.jsp">Sección B - TAREAS OPERACIONALES</a></li>
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#a1"><small>-Generales</small></a></li>
                            <li class="list-group-item"><a href="#a2"><small>-Rangos de Consumo</small></a></li>
                            <li class="list-group-item"><a href="#a3"><small>-Rangos de Insumos Autorizados</small></a></li>
                            <li class="list-group-item"><a href="#a4"><small>-Procedimiento de reposición de Inventarios</small></a></li>
                            <li class="list-group-item"><a href="#a5"><small>-Abasto</small></a></li>
                            <li class="list-group-item"><a href="#a6"><small>-Certificación</small></a></li>
                            <li class="list-group-item"><a href="#a7"><small>-Datos</small></a></li>
                        </ul>
                    </ul>
                    <ul class="nav nav-sidebar">
                        <li class=""><a href="estadisticasC.jsp">Sección C - FARMACIA</a></li>
                        <li class=""><a href="estadisticasD.jsp">Sección D - ALMACÉN</a></li>
                        <li class=""><a href="estadisticasE.jsp">Sección E - EQUIPO DE CÓMPUTO, INTERNET Y TELEFONÍA</a></li>
                    </ul>
                </div>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main " id="principal">
                    <a name="a1"></a>
                    <h1 class="page-header">B. TAREAS OPERACIONALES</h1>
                    <h4>Total de Unidades Censadas: <%=tam_cen%></h4>
                    <div class="row placeholders">
                        <div id="e1" class="col-lg-6"></div>
                    </div>

                    <a name="a2"></a>
                    <h4 class="page-header">Rangos de Consumo</h4>
                    <div class="row placeholders">
                        <div id="e2" class="col-lg-12"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e3" class="col-lg-12"></div>
                    </div>
                    <div class="row placeholders">
                        <div id="e4" class="col-lg-12"></div>
                    </div>

                    <a name="a3"></a>
                    <h4 class="page-header">Rangos de Insumos Autorizados</h4>
                    <div class="row placeholders">
                        <div id="e5" class="col-lg-6"></div>
                        <div id="e6" class="col-lg-6"></div>
                    </div>

                    <a name="a4"></a>
                    <h4 class="page-header">Procedimiento de reposición de Inventarios</h4>
                    <div class="row placeholders">
                        <div id="e7" class="col-lg-12"></div>
                    </div>

                    <div class="row placeholders">
                        <div id="e8" class="col-lg-6"></div>
                        <div id="e9" class="col-lg-6"></div>
                    </div>

                    <a name="a5"></a>
                    <h4 class="page-header">Abasto</h4>
                    <div class="row placeholders">
                        <div id="e10" class="col-lg-6"></div>
                        <div id="e12" class="col-lg-6"></div>
                    </div>

                    <a name="a6"></a>
                    <h4 class="page-header">Certificación</h4>
                    <div class="row placeholders">
                        <div id="e11" class="col-lg-6"></div>
                    </div>


                    <a name="a7"></a>
                    <h2 class="sub-header">Datos</h2>
                    <div class="" id="datos">
                        <table class="table table-striped" id="tabla">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Unidad</th>
                                    <th>Sist Informático</th>
                                    <th>Rec x Día</th>
                                    <th>Med x Rec</th>
                                    <th>CPM</th>
                                    <th>Med Autorizado</th>
                                    <th>Mat Cur Autorizado</th>
                                    <th>Proc Rep Inv</th>
                                    <th>Surte</th>
                                    <th>Fecuencia Surt</th>
                                    <th>% Abasto</th>
                                    <th>Certificada</th>
                                    <th>Fec ult Abasto</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    try {
                                        con.conectar();
                                        int i = 0;
                                        ResultSet rset = con.consulta("SELECT a.campo_1, b.* FROM tb_a a, tb_b b where a.id_uni = b.id_uni and a.campo_31!='';");
                                        while (rset.next()) {
                                            i++;
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
                                    <td><%=rset.getString(5)%></td>
                                    <td><%=rset.getString(7)%></td>
                                    <td><%=rset.getString(8)%></td>
                                    <td><%=rset.getString(9)%></td>
                                    <td><%=rset.getString(10)%></td>
                                    <td><%=rset.getString(11)%></td>
                                    <td><%=rset.getString(12)%></td>
                                    <td><%=rset.getString(13)%></td>
                                    <td><%=rset.getString(16)%></td>
                                    <td><%=rset.getString(17)%></td>
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
                    text: 'Total de U.A. con y sin sistema informático'
                },
                tooltip: {
                    pointFormat: 'Tienen S.I. : {point.y} Unidades'
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
                ResultSet rset = con.consulta("select campo_32,count(campo_32) from tb_b where campo_32 != '' GROUP BY campo_32 ;");
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
                    type: 'column'
                },
                title: {
                    text: 'B.2 Recetas expedidas por día'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Recetas por día'
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
                    pointFormat: 'Recetas por día en: <b>{point.y} Unidades</b>',
                },
                /*plotOptions: {
                 bar: {
                 dataLabels: {
                 enabled: true
                 }
                 }
                 },*/
                series: [{
                        name: 'Recetas',
                        data: [
        <%                                try {
			int r1 = 0, r2 = 0, r3 = 0;
                con.conectar();
                ResultSet rset = con.consulta("select campo_33,count(campo_33) from tb_b where campo_33!='' and campo_33!= 'NA' and campo_33!= 'N/A' GROUP BY id_uni order by campo_33+0;");
                while (rset.next()) {
					int total=0;
					try{
						total = Integer.parseInt((rset.getString(1)));
						System.out.println("---" + total);
	
						if (total >= 1 && total <= 19) {
							r1++;
						}
						if (total >= 20 && total <= 59) {
							r2++;
						}
						if (total >= 60 && total <= 500) {
							r3++;
						}
					} catch (Exception e){}
                }
                con.cierraConexion();
				%>
				['1 a 19', <%=r1%>],
                                    ['20 a 59', <%=r2%>],
                                    ['Mas de 60', <%=r3%>],
				<%
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
                    text: 'B.3 Medicamentos prescritos por receta'
                },
                tooltip: {
                    // pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Medicamentos por receta'
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
                    pointFormat: 'Medicamentos por receta en: <b>{point.y} Unidades</b>',
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
                ResultSet rset = con.consulta("select campo_34,count(campo_34) from tb_b where campo_34!='' and campo_34!= 'NA' and campo_34!= 'N/A' GROUP BY campo_34 order by campo_34+0;");
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
                    text: 'B.5 Consumo promedio de piezas x mes'
                },
                tooltip: {
                    //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Piezas por mes'
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
                    pointFormat: 'Piezas por mes en: <b>{point.y} Unidades</b>',
                },
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                int r1 = 0, r2 = 0, r3 = 0, r4 = 0, r5 = 0, r6 = 0, r7 = 0;
                ResultSet rset = con.consulta("select campo_36,count(campo_36) from tb_b where campo_36!='' and campo_36!= 'NA' and campo_36!= 'N/A' GROUP BY id_uni order by campo_36+0;");
                while (rset.next()) {
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

                    if (total >= 1 && total <= 100) {
                        r1++;
                    }
                    if (total >= 101 && total <= 250) {
                        r2++;
                    }
                    if (total >= 251 && total <= 500) {
                        r3++;
                    }
                    if (total >= 501 && total <= 1000) {
                        r4++;
                    }
                    if (total >= 1001 && total <= 2500) {
                        r5++;
                    }
                    if (total >= 2501 && total <= 5000) {
                        r6++;
                    }
                    if (total >= 5000 && total <= 10000) {
                        r7++;
                    }
                }
                con.cierraConexion();

        %>
                                    ['1 a 100', <%=r1%>],
                                    ['101 a 250', <%=r2%>],
                                    ['251 a 500', <%=r3%>],
                                    ['501 a 1,000', <%=r4%>],
                                    ['1,001 a 2,500', <%=r5%>],
                                    ['2,501 a 5,000', <%=r6%>],
                                    ['5,001 a 10,000', <%=r7%>],
        <%
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });


            $('#e5').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'B.6 Número de Claves Autorizadas'
                },
                tooltip: {
                    //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Medicamentos autorizados'
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
                    pointFormat: 'Medicamentos autorizados en: <b>{point.y} Unidades</b>',
                },
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                int r1 = 0, r2 = 0, r3 = 0, r4 = 0, r5 = 0, r6 = 0, r7 = 0;
                ResultSet rset = con.consulta("select campo_37,count(campo_37) from tb_b where campo_37!='' and campo_37!= 'NA' and campo_37!= 'N/A' GROUP BY id_uni order by campo_37+0;");
                while (rset.next()) {
                    try {
                        String[] result = rset.getString(1).split(",");
                        /*System.out.println("+++"+result.length);
                         System.out.println("***"+result[0]);
                         System.out.println("---"+result[1]);
                         System.out.println(result[0] + result[1]);*/
                        int total = Integer.parseInt((result[0]).trim());
                        if (result.length > 1) {
                            total = Integer.parseInt((result[0] + result[1]));
                        }
                        System.out.println("***---+" + total);

                        if (total >= 1 && total <= 50) {
                            r1++;
                        }
                        if (total >= 51 && total <= 100) {
                            r2++;
                        }
                        if (total >= 101 && total <= 150) {
                            r3++;
                        }
                        if (total >= 151 && total <= 200) {
                            r4++;
                        }
                        if (total >= 201 && total <= 250) {
                            r5++;
                        }
                        if (total >= 251 && total <= 300) {
                            r6++;
                        }
                        if (total >= 300 && total <= 500) {
                            r7++;
                        }
                    } catch (Exception e) {
                        System.out.println("Error+++++" + e.getMessage());
                    }
                }
                con.cierraConexion();

        %>
                                    ['1 a 50', <%=r1%>],
                                    ['51 a 100', <%=r2%>],
                                    ['101 a 150', <%=r3%>],
                                    ['151 a 200', <%=r4%>],
                                    ['201 a 250', <%=r5%>],
                                    ['251 a 300', <%=r6%>],
                                    ['301 a 500', <%=r7%>],
        <%
            } catch (Exception e) {
            }
        %>

                                ]
                            }]
            });


            $('#e6').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'B.7 Número de Claves de Material de Curación Autorizadas'
                },
                tooltip: {
                    //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Claves de material de curación autorizadas'
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
                    pointFormat: 'Claves de mat. de curación autorizadas en: <b>{point.y} Unidades</b>',
                },
                        series: [{
                                name: 'Total',
                                data: [
        <%                                try {
                con.conectar();
                int r1 = 0, r2 = 0, r3 = 0, r4 = 0, r5 = 0, r6 = 0, r7 = 0;
                ResultSet rset = con.consulta("select campo_38,count(campo_38) from tb_b where campo_38!='' and campo_38!= 'NA' and campo_38!= 'N/A' GROUP BY id_uni order by campo_38+0;");
                while (rset.next()) {
                    try {
                        String[] result = rset.getString(1).split(",");
                        /*System.out.println("+++"+result.length);
                         System.out.println("***"+result[0]);
                         System.out.println("---"+result[1]);
                         System.out.println(result[0] + result[1]);*/
                        int total = Integer.parseInt((result[0]).trim());
                        if (result.length > 1) {
                            total = Integer.parseInt((result[0] + result[1]));
                        }
                        System.out.println("***---+" + total);

                        if (total >= 1 && total <= 50) {
                            r1++;
                        }
                        if (total >= 51 && total <= 100) {
                            r2++;
                        }
                        if (total >= 101 && total <= 150) {
                            r3++;
                        }
                        if (total >= 151 && total <= 200) {
                            r4++;
                        }
                        if (total >= 201 && total <= 250) {
                            r5++;
                        }
                        if (total >= 251 && total <= 300) {
                            r6++;
                        }
                        if (total >= 300 && total <= 500) {
                            r7++;
                        }
                    } catch (Exception e) {
                        System.out.println("Error+++++" + e.getMessage());
                    }
                }
                con.cierraConexion();

        %>
                                    ['1 a 50', <%=r1%>],
                                    ['51 a 100', <%=r2%>],
                                    ['101 a 150', <%=r3%>],
                                    ['151 a 200', <%=r4%>],
                                    ['201 a 250', <%=r5%>],
                                    ['251 a 300', <%=r6%>],
                                    ['301 a 500', <%=r7%>],
        <%
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
                    text: 'B.8 Procedimiento de Reposición de Inventarios'
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
                ResultSet rset = con.consulta("select campo_39,count(campo_39) from tb_b where campo_39 != '' and campo_39!= 'NA' and campo_39!='N/A'  GROUP BY campo_39 ;");
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
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'B.9 Quién surte a esta Unidad de Atención'
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
                ResultSet rset = con.consulta("select campo_40,count(campo_40) from tb_b where campo_40 != '' and campo_40!= 'NA' and campo_40!='N/A' GROUP BY campo_40 ;");
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


            $('#e9').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'B.10 ¿Con qué frecuencia?'
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
                ResultSet rset = con.consulta("select campo_41,count(campo_41) from tb_b where campo_41 != '' and campo_41!= 'NA' and campo_41!='N/A' GROUP BY campo_41 ;");
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


            $('#e10').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'B.11 Rangos de porcentajes de abasto'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Nivel de Abasto'
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
                    pointFormat: 'de Abasto en: <b>{point.y} Unidades</b>',
                },
                series: [{
                        name: 'Información',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_42,count(campo_42) from tb_b where campo_42!='' and campo_42!= 'NA' and campo_42!= 'N/A' GROUP BY campo_42 order by campo_42+0;");
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


            $('#e11').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: 'B.14 Total de U.A. certificadas y no certificadas'
                },
                tooltip: {
                    pointFormat: 'Unidades {point.name} Certificadas:{point.y} Unidades'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>Unidades {point.name} Certificadas</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                        type: 'pie',
                        name: 'Total',
                        data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("select campo_43,count(campo_43) from tb_b where campo_43 != '' GROUP BY campo_43 ;");
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

            $('#e12').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'B.15 Rangos de fechas de último abasto'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: 'Recetas por día'
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
                tooltip: {
                    //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: 'fecha de Abasto en: <b>{point.y} Unidades</b>',
                },
                        series: [{
                                name: 'Información',
                                data: [
        <%                                try {
                con.conectar();
                ResultSet rset = con.consulta("SELECT count(id_uni),campo_46,MONTH(STR_TO_DATE(campo_46,'%d/%m/%Y')) as mes, YEAR(STR_TO_DATE(campo_46,'%d/%m/%Y')) as anio from tb_b where campo_46!='' group by YEAR(STR_TO_DATE(campo_46,'%d/%m/%y')), MONTH(STR_TO_DATE(campo_46,'%d/%m/%Y'));");
                while (rset.next()) {
                    String mes = "";
                    if (rset.getString(3).equals("1")) {
                        mes = "ENE";
                    }
                    if (rset.getString(3).equals("2")) {
                        mes = "FEB";
                    }
                    if (rset.getString(3).equals("3")) {
                        mes = "MAR";
                    }
                    if (rset.getString(3).equals("4")) {
                        mes = "ABR";
                    }
                    if (rset.getString(3).equals("5")) {
                        mes = "MAY";
                    }
                    if (rset.getString(3).equals("6")) {
                        mes = "JUN";
                    }
                    if (rset.getString(3).equals("7")) {
                        mes = "JUL";
                    }
                    if (rset.getString(3).equals("8")) {
                        mes = "AGO";
                    }
                    if (rset.getString(3).equals("9")) {
                        mes = "SEP";
                    }
                    if (rset.getString(3).equals("10")) {
                        mes = "OCT";
                    }
                    if (rset.getString(3).equals("11")) {
                        mes = "NOV";
                    }
                    if (rset.getString(3).equals("12")) {
                        mes = "DIC";
                    }
        %>
                                    ['<%=mes%> - <%=rset.getString(4)%>', <%=rset.getString(1)%>],
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
