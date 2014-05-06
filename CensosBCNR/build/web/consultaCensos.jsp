<%-- 
    Document   : consultaCensos
    Created on : 07-oct-2013, 10:38:25
    Author     : wence
--%>

<%@page import="org.json.*" %>
<%@page import="java.sql.*"%>

<%@ page import="conn.ConectionDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String para="",consulta="";
    int cont=0,tope=162,cont_cen=0,pos=0;
    JSONObject json = new JSONObject();
    String arrJson[]= new String[162];
     try {
           para=request.getParameter("id");
   }catch (Exception ex){}
     
     while(cont_cen<tope)
        {
            cont_cen+=1;
            if(cont_cen==9){
             arrJson[8]="claveHos";   
            }
            else{
            arrJson[pos]="campo_"+cont_cen;
            //out.print(""+arrJson[pos]);
            }
            //out.print(""+arrJson[pos]);
            pos++;
        }
   
             //objeto para hacer la conexión a la BDD
    ConectionDB obj= new ConectionDB();
    ResultSet rset=null;
    try {
           obj.conectar();
   }catch (Exception ex){}
    consulta="select * from enc1 e1, enc2 e2, clavesh hosp where e1.claveHos=hosp.idClave and e2.claveHos=hosp.idClave  and e1.claveHos='"+para+"';";
    rset=obj.consulta(consulta);
    if(rset.next()){
        pos=0;
        while(cont<161)
        { 
            cont++;
	    json.put("json_"+cont, rset.getString(arrJson[pos]));
            //out.print("json_"+cont+""+rset.getString(arrJson[pos]));
            pos++;
        }
   }// end if

   obj.cierraConexion();
   out.print(json); 

%>