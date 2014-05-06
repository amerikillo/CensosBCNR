/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import conn.ConectionDB;
import conn.ConectionDB_Nube;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Amerikillo
 */
public class SubeJuris extends HttpServlet {

    ConectionDB_Nube con2 = new ConectionDB_Nube();
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
            if (request.getParameter("accion").equals("subir")) {

                con.conectar();
                con2.conectar();
                try {
                    ResultSet rset = con.consulta("select * from jurisdicciones where campo_1!=''; ");
                    while (rset.next()) {
                        String query = "insert into jurisdicciones values (";
                        for (int i = 1; i < 20; i++) {
                            query = query + "'" + rset.getString(i) + "', ";
                        }
                        query = query + "'" + rset.getString(20) + "'";
                        query = query + ")";
                        System.out.println(query);
                        try {
                            con2.insertar(query);
                        } catch (Exception e) {
                            /*
                             *Porque no se pudo insertar
                             */

                            query = "update  jurisdicciones set ";
                            for (int i = 1; i < 17; i++) {
                                query = query + "campo_" + i + " ='" + rset.getString(i+2) + "', ";
                            }
                            query = query + " campo_17='" + rset.getString(19) + "'";
                            query = query + " where no_jur = '" + rset.getString(1) + "' ";
                            System.out.println(query);
                            try {
                                con2.insertar(query);
                            } catch (Exception ex) {
                                out.println("<script>alert('Error al actualizar: "+ex.getMessage()+"')</script>");
                            }
                        }
                    }

                } catch (Exception e) {
                }
                con2.cierraConexion();
                con.cierraConexion();
            }
            out.println("<script>alert('Se subió la información correctamente')</script>");
            //response.sendRedirect("capturaJuris.jsp");
        } catch (Exception e) {
            out.println("<script>alert('Error al Subir la informacion, consulte las unidades que le faltan')</script>");
        }
        out.println("<script>window.location='capturaJuris.jsp'</script>");
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
