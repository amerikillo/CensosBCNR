/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conn.*;// package que contiene la Clase ConectionDBS
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.*;
/**
 *
 * @author wence
 */
@WebServlet(name = "campos", urlPatterns = {"/campos"})
public class Campos extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    ConectionDB obj = new ConectionDB(); 
   
   
    java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
    java.text.DateFormat df2 = new java.text.SimpleDateFormat("hh:mm:ss");

   
   public int ban,cont_cam,pos,insertar;
   public String campo,n_campo,qry="";
   public String arr_a[] = new String[30];
   public String arr_f[] = new String[1];

    

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession sesion = request.getSession(true);
        String bandera= request.getParameter("ban");
         PrintWriter out = response.getWriter();
        ban=Integer.parseInt(bandera);
        
        switch(ban) {
                
           case 1:
            campo="campo_";
               cont_cam=1;
               pos=0;
                    while(pos<30){
                        n_campo=campo+cont_cam;
                        arr_a[pos]=request.getParameter(n_campo);
                        cont_cam++;
                        pos++;
                        
                    }
                    try {
                obj.conectar();
                //int pos2=0;
                pos=0;
                qry="insert into tb_a values('1001','"+arr_a[pos]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"',"
                    + "'"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"'"
                    + ",'"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"'"
                    + ",'"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"','"+arr_a[pos++]+"');";
                insertar=obj.insertar(qry);
                obj.cierraConexion();
            } catch (SQLException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
                     try {
            /* TODO output your page here. You may use following sample code. */
           out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardaSeccion</title>");            
            out.println("</head>");
            out.println("<body>");
            for(int x=0;x<pos;x++){
            out.println("<h3>arrays elements: " + arr_a[x] + "</h3>");
            }
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
                break;
              
            case 2:
           campo="campo_";
               cont_cam=1;
               pos=0;
                    while(pos<1){
                        n_campo=campo+cont_cam;
                        arr_f[pos]=request.getParameter(n_campo);
                        cont_cam++;
                        pos++;
                        
                    }
                    try {
                obj.conectar();
                //int pos2=0;
                pos=0;
                qry="insert into f values('1001','"+arr_f[pos]+"','"+arr_f[pos]+"');";
                insertar=obj.insertar(qry);
                obj.cierraConexion();
            } catch (SQLException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
                     try {
            /* TODO output your page here. You may use following sample code. */
           out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuardaSeccion</title>");            
            out.println("</head>");
            out.println("<body>");
            for(int x=0;x<pos;x++){
            out.println("<h3>arrays elements: " + arr_f[x] + "</h3>");
            }
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
                break;
            case 4:

                break;
            case 5:
                
                break;
            case 6:
                       
                break;
            default:

                break;
 }
        
    }
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
 public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        ban=Integer.parseInt(request.getParameter("ban"));
        switch(ban) {
          case 1: 
           
              break;
          case 2:
             
              break;
             
 
 } 
  
     
 }// end of doGet
}// end of the Class
