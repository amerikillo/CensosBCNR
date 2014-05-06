<%-- 
    Document   : exrpotarExcel
    Created on : 26-mar-2014, 12:39:00
    Author     : Americo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="conn.ConectionDB"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    ConectionDB con = new ConectionDB();
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition", "attachment;filename=\"Información de Censos.xls\"");

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table border="1">

            <tr>
                <td>Encuestador</td>
                <td>No. de la Unidad</td>
                <td>A.1 Nombre de la    Unidad</td>
                <td>A.2 Dirección</td>
                <td>A.3 Referencias</td>
                <td>A.4 Colonia</td>
                <td>A.5 Población</td>
                <td>A.6 Código Postal</td>
                <td>A.7 CLUES</td>
                <td>A.8 Teléfono fijo</td>
                <td>A.9 Fax</td>
                <td>A.10 Correo Electrónico</td>
                <td>A.11 Jurisdicción Perteneciente</td>
                <td>A.12 Coordinación Municipal</td>
                <td>A.13 Municipio</td>
                <td>A.14 Nº de Modulos</td>
                <td>A.15 Categoría</td>
                <td>A.16 Nombre del Responsable</td>
                <td>A.17 Teléfono del Responsable</td>
                <td>A.18 Correo Elect. Responsable</td>
                <td>A.19 Nombre del Odontólogo</td>
                <td>A.20 Población Atendida</td>
                <td>A.21 Nº de Doctores (Base)</td>
                <td>A.22 No. Mapa</td>
                <td>A.23 Nº de Pasantes</td>
                <td>A.24 Nº de Enfermeras</td>
                <td>A.25 Horario de Atención Desde</td>
                <td>A.26 Horario de Atención Hasta</td>
                <td>A.27 Dias Laborales</td>
                <td>A.28 ¿La Unidad cuenta con Servicios?</td>
                <td>A.29 ¿Cuántos Servicios?</td>
                <td>A.30 Describa los Servicios</td>
                <td>A.31 Clima Predominante</td>
                <td>B.1 ¿Existe Sistema Informático de Captura    de Recetas?</td>
                <td>B.2 ¿Cuántas Recetas Promedio por día se    expiden?</td>
                <td>B.3 ¿Cuántos medicamentos preescribe en    promedio por receta?</td>
                <td>B.4 Describa el proceso de captura de las    recetas</td>
                <td>B.5 ¿Cuál es el consumo promedio mensual de    piezas?</td>
                <td>B.6 Número de Claves Autorizadas para este    Centro</td>
                <td>B.7 Número de Claves de Material de    Curación Autorizadas para este Centro</td>
                <td>B.8 ¿Cuál es el Procedimiento de Reposición    de Inventarios?</td>
                <td>B.9 ¿Quién surte a esta Unidad de Atención?</td>
                <td>B.10 ¿Con qué frecuencia?</td>
                <td>B.11 ¿Cuál es el nivel de abasto actual?</td>
                <td>B.12 ¿Realizan inventarios en la unidad?</td>
                <td>B.13 ¿Dónde se guarda el insumo?</td>
                <td>B.14 ¿Esta unidad esta certificada?</td>
                <td>B.15 Fecha de última visita de Abasto</td>
                <td>C.1 ¿Cuenta con Farmacia?</td>
                <td>C.2 ¿Maneja Controlados?</td>
                <td>C.3 Horario de atención DE</td>
                <td>C.3 Horario de atención A</td>
                <td>C.4 ¿Quién atiende la farmacia?</td>
                <td>C.5 Nº de Anaqueles</td>
                <td>C.6 Espacio aprox en mts2 de la Farmacia</td>
                <td>C.7 ¿Cuenta con red fría?</td>
                <td>D.1 ¿Cuenta con área de almacén?</td>
                <td>D.2 Horario de atención DE</td>
                <td>D.2 Horario de atención A</td>
                <td>D.3 Espacio aprox en mts2 del Almacén</td>
                <td>D.4 Número de Anaqueles o Racks en Almacen</td>
                <td>D.5 ¿Cómo surten los Insumos Médicos en el    Almacén?</td>
                <td>D.6 ¿Cuentan con Área para carga y descarga    en el Almacén?</td>
                <td>E.1 ¿Cuenta con equipo de Cómputo?</td>
                <td>E.2 CPU</td>
                <td>E.2 Monitor</td>
                <td>E.2 Impresora</td>
                <td>E.2 No-Break</td>
                <td>E.3 ¿Cuenta con conexión a la Internet?</td>
                <td>E.4 Señal de Telefonía Celular</td>
                <td>E.5 ¿Cuál (es)?</td>
                <td>F. OBSERVACIONES</td>
            </tr>
            <%              try {
                    con.conectar();
                    ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni and a.campo_31!='' order by a.id_uni+0");
                    while (rset.next()) {
                        out.println("<tr>");
                        String enc = "";
                        ResultSet rset_enc = con.consulta("select encuestador from tb_registro_censos where seccion = 'INICIO' and encuestador !='' and id_uni = '" + rset.getString(1) + "' ");
                        while (rset_enc.next()) {
                            enc = rset_enc.getString(1);
                        }
                        out.println("<td>"+enc+"</td>");
                        for (int i = 1; i <= 78; i++) {
                            if (i == 33 || i == 58 || i == 67 || i == 77 || i == 49) {
                                i++;
                            }
                            if (i == 59 || i == 68) {
                                i++;
                            }
            %>
            <td><%=rset.getString(i)%></td>
            <%
                        }
                    }
                    out.println("<tr>");
                    con.cierraConexion();
                } catch (Exception e) {
                }
            %>
        </table>
        <h1>&nbsp;</h1>
    </body>
</html>
