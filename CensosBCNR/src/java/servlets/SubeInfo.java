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
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Amerikillo
 */
public class SubeInfo extends HttpServlet {

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

        HttpSession sesion = request.getSession(true);
        try {
            if (request.getParameter("subir").equals("1")) {
                con.conectar();
                con2.conectar();
                ResultSet rset = con.consulta("select * from tb_a as a, tb_b as b, tb_c as c, tb_d as d, tb_e as e, tb_f as f, tb_unidades as clave where clave.id_uni=a.id_uni and clave.id_uni=b.id_uni and clave.id_uni=c.id_uni and clave.id_uni=d.id_uni and clave.id_uni=e.id_uni and clave.id_uni=f.id_uni;");
                while (rset.next()) {
                    int ban = 0;

                    try {
                        con2.actualizar("insert into tb_registro_censos values ('" + rset.getString(1) + "', 'SUBE INFO', NOW(), 'SUBE INFORMACION');");
                    } catch (Exception e) {

                    }

                    ResultSet rset2 = con2.consulta("select id_uni from tb_a where id_uni = '" + rset.getString(1) + "'");
                    while (rset2.next()) {
                        ban = 1;
                    }
                    if (ban == 0) {//No Existe el registro, se inserta el actualiza
                    /*
                         * Query para la Tabla A
                         */
                        String tb_a = "insert into tb_a values ('" + rset.getString(1) + "', ";
                        for (int i = 1; i < 31; i++) {
                            tb_a = tb_a + " '" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_a = tb_a + " '" + rset.getString("campo_31") + "');";
                        try {
                            con2.insertar(tb_a);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla B
                         */
                        String tb_b = "insert into tb_b values ('" + rset.getString(1) + "', ";
                        for (int i = 32; i < 46; i++) {
                            tb_b = tb_b + " '" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_b = tb_b + " '" + rset.getString("campo_46") + "');";
                        try {
                            con2.insertar(tb_b);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla C
                         */
                        String tb_c = "insert into tb_c values ('" + rset.getString(1) + "', ";
                        for (int i = 47; i < 55; i++) {
                            tb_c = tb_c + " '" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_c = tb_c + " '" + rset.getString("campo_55") + "');";
                        try {
                            con2.insertar(tb_c);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla D
                         */
                        String tb_d = "insert into tb_d values ('" + rset.getString(1) + "', ";
                        for (int i = 56; i < 63; i++) {
                            tb_d = tb_d + " '" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_d = tb_d + " '" + rset.getString("campo_63") + "');";
                        try {
                            con2.insertar(tb_d);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla E
                         */
                        String tb_e = "insert into tb_e values ('" + rset.getString(1) + "', ";
                        for (int i = 64; i < 71; i++) {
                            tb_e = tb_e + " '" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_e = tb_e + " '" + rset.getString("campo_71") + "');";
                        try {
                            con2.insertar(tb_e);
                        } catch (SQLException e) {
                        }
                        /*
                         *Qurery para la Tabla F
                         */
                        String tb_f = "insert into tb_f values ('" + rset.getString(1) + "', '" + rset.getString("campo_72") + "');";
                        try {
                            con2.insertar(tb_f);
                        } catch (SQLException e) {
                        }

                    } else {//Si existe el registro, se actualiza
                        /*
                         *Query para tabla a
                         */
                        String tb_a = "update tb_a set ";
                        for (int i = 1; i < 31; i++) {
                            tb_a = tb_a + " campo_" + i + "='" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_a = tb_a + "campo_31='" + rset.getString("campo_31") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_a);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_b = "update tb_b set ";
                        for (int i = 32; i < 46; i++) {
                            tb_b = tb_b + " campo_" + i + "='" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_b = tb_b + "campo_46='" + rset.getString("campo_46") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_b);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_c = "update tb_c set ";
                        for (int i = 47; i < 55; i++) {
                            tb_c = tb_c + " campo_" + i + "='" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_c = tb_c + "campo_55='" + rset.getString("campo_55") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_c);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_d = "update tb_d set ";
                        for (int i = 56; i < 63; i++) {
                            tb_d = tb_d + " campo_" + i + "='" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_d = tb_d + "campo_63='" + rset.getString("campo_63") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_d);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_e = "update tb_e set ";
                        for (int i = 64; i < 71; i++) {
                            tb_e = tb_e + " campo_" + i + "='" + rset.getString("campo_" + i) + "', ";
                        }
                        tb_e = tb_e + "campo_71='" + rset.getString("campo_71") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_e);
                        } catch (SQLException e) {
                        }
                        /*
                         *Query para tabla a
                         */
                        String tb_f = "update tb_f set campo_72='" + rset.getString("campo_72") + "' where id_uni='" + rset.getString(1) + "'";
                        try {
                            con2.insertar(tb_f);
                        } catch (SQLException e) {
                        }
                    }
                }

                con2.cierraConexion();
                con.cierraConexion();
                out.println("<script>alert('Se subió la información correctamente')</script>");
                out.println("<script>window.location='indexCapR.jsp'</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Error al Subir la informacion, consulte las unidades que le faltan')</script>");
            out.println("<script>window.location='indexCapR.jsp'</script>");
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
