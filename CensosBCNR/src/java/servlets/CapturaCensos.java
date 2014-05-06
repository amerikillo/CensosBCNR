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
import clasesJava.*;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Amerikillo
 */
public class CapturaCensos extends HttpServlet {

    CapCensos captura = new CapCensos();

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CapturaCensos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CapturaCensos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        
        
            HttpSession sesion = request.getSession(true);
        //processRequest(request, response);
        if (request.getParameter("envio").equals("1")) {
            try {
                byte[] a = request.getParameter("encuestador").getBytes("ISO-8859-1");
                    String value = new String(a, "UTF-8");
                captura.Captura(request.getParameter("id_uni"), request.getParameter("tipo"), request.getParameter("nombre_gnk"), request.getParameter("juris"), request.getParameter("fecha"), request.getParameter("hora"), value, request.getParameter("muni"), request.getParameter("clues"), request.getParameter("prueba"));
            } catch (SQLException ex) {
                Logger.getLogger(CapturaCensos.class.getName()).log(Level.SEVERE, null, ex);
            }
            sesion.setAttribute("id_uni", request.getParameter("id_uni"));
            sesion.setAttribute("encuestador", request.getParameter("encuestador"));
            response.sendRedirect("capturaCensosR.jsp");
        }
        
        if (request.getParameter("envio").equals("2")) {
            sesion.setAttribute("id_uni", request.getParameter("id_uni"));
            response.sendRedirect("cargaFotosCensos.jsp");
        }
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
