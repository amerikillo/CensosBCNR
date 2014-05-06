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
public class EntrevistaJuris extends HttpServlet {

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

                byte[] a = request.getParameter("entrevista").getBytes("ISO-8859-1");
                String entrevista = new String(a, "UTF-8");
                String juris = new String(request.getParameter("juris").getBytes("ISO-8859-1"), "UTF-8");
                con.conectar();
                try {
                    con.insertar("update tb_entrevista_juris set entrevista= '" + entrevista + "' where des_jur = '" + juris + "'  ");

                    out.println("<script>alert('Se guardaron los datos correctamente.')</script>");
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    out.println("<script>alert('Error al guardar los datos')</script>");
                }
                con.cierraConexion();
                out.println("<script>window.location='capEntrevistaJuris.jsp'</script>");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
