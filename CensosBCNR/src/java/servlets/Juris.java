/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conn.*;// package que contiene la Clase ConectionDBS

/**
 *
 * @author Americo
 */
public class Juris extends HttpServlet {

    ConectionDB con = new ConectionDB();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if (request.getParameter("accion").equals("guardar")) {

                byte[] a = request.getParameter("campo_1").getBytes("ISO-8859-1");
                String campo_1 = new String(a, "UTF-8");
                a = request.getParameter("campo_2").getBytes("ISO-8859-1");
                String campo_2 = new String(a, "UTF-8");
                a = request.getParameter("campo_3").getBytes("ISO-8859-1");
                String campo_3 = new String(a, "UTF-8");
                a = request.getParameter("campo_4").getBytes("ISO-8859-1");
                String campo_4 = new String(a, "UTF-8");
                a = request.getParameter("campo_5").getBytes("ISO-8859-1");
                String campo_5 = new String(a, "UTF-8");
                a = request.getParameter("campo_6").getBytes("ISO-8859-1");
                String campo_6 = new String(a, "UTF-8");
                a = request.getParameter("campo_7").getBytes("ISO-8859-1");
                String campo_7 = new String(a, "UTF-8");
                a = request.getParameter("campo_8").getBytes("ISO-8859-1");
                String campo_8 = new String(a, "UTF-8");
                a = request.getParameter("campo_9").getBytes("ISO-8859-1");
                String campo_9 = new String(a, "UTF-8");
                a = request.getParameter("campo_10").getBytes("ISO-8859-1");
                String campo_10 = new String(a, "UTF-8");
                a = request.getParameter("campo_11").getBytes("ISO-8859-1");
                String campo_11 = new String(a, "UTF-8");
                a = request.getParameter("campo_12").getBytes("ISO-8859-1");
                String campo_12 = new String(a, "UTF-8");
                a = request.getParameter("campo_13").getBytes("ISO-8859-1");
                String campo_13 = new String(a, "UTF-8");
                a = request.getParameter("campo_14").getBytes("ISO-8859-1");
                String campo_14 = new String(a, "UTF-8");
                a = request.getParameter("campo_15").getBytes("ISO-8859-1");
                String campo_15 = new String(a, "UTF-8");
                a = request.getParameter("campo_16").getBytes("ISO-8859-1");
                String campo_16 = new String(a, "UTF-8");
                a = request.getParameter("campo_17").getBytes("ISO-8859-1");
                String campo_17 = new String(a, "UTF-8");
                a = request.getParameter("juris").getBytes("ISO-8859-1");
                String juris = new String(a, "UTF-8");
                con.conectar();
                try {
                    con.insertar("update jurisdicciones set campo_1= '" + campo_1 + "', campo_2= '" + campo_2 + "', campo_3= '" + campo_3 + "', campo_4= '" + campo_4 + "', campo_5= '" + campo_5 + "', campo_6= '" + campo_6 + "', campo_7= '" + campo_7 + "', campo_8= '" + campo_8 + "', campo_9= '" + campo_9 + "', campo_10= '" + campo_10 + "', campo_11= '" + campo_11 + "', campo_12= '" + campo_12 + "', campo_13= '" + campo_13 + "', campo_14= '" + campo_14 + "', campo_15= '" + campo_15 + "', campo_16= '" + campo_16 + "', campo_17= '" + campo_17 + "' where des_jur = '" + juris + "'  ");

                    out.println("<script>alert('Se guardaron los datos correctamente.')</script>");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    out.println("<script>alert('Error al guardar los datos')</script>");
                }
                con.cierraConexion();
                out.println("<script>window.location='capturaJuris.jsp'</script>");
            }
        } catch (Exception e) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
