<%-- 
    Document   : convierteMay
    Created on : 06-nov-2013, 12:23:27
    Author     : wence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.ConectionDB"%>
<%
ConectionDB obj= new ConectionDB();
obj.conectar();
String campo="campo_",var="";
int num=75,inicio=75,tope=161;
String qry="";
    while(inicio<=tope)
    {
        var=campo+num;
            /*if(var.equals("campo_9")){
                var="claveHos";
            }*/
            /*if(var.equals("campo_13")){
                var="campo_14";
                num++;
            }*/
        qry="UPDATE enc2 SET "+var+" = UPPER("+var+");";
        obj.actualizar(qry);
        num++;
        inicio++;
    }
        //"UPDATE enc1 SET campo_7 = UPPER(campo_7);";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
