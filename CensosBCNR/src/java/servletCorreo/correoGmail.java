/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servletCorreo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conn.*;
import java.sql.SQLException;
/**
 *
 * @author wence
 */
@WebServlet(name = "correoGmail", urlPatterns = {"/servletCorreo"})
public class correoGmail extends HttpServlet {
    private String cuenta_correo;
    private String nombre;
    private String comentario;
    private String qry;
    ConectionDB obj = new ConectionDB();
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        qry="insert into contactos values(0,'"+nombre +"','"+cuenta_correo +"','"+comentario+"');";
            obj.conectar();
            int regresa;
            try{
            regresa = obj.insertar(qry);
            } catch(SQLException e){
            }
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
                props.setProperty("mail.smtp.user", "ricardo.wence@gnkl.mx");
            props.setProperty("mail.smtp.auth", "true");

            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);

            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ricardo.wence@gnkl.mx"));
            message.addRecipient(
                Message.RecipientType.TO,
                new InternetAddress(cuenta_correo));//Aqui se pone la direccion a donde se enviara el correo
            message.setSubject("Recibimos su Información / GNK Logística");
            message.setText(
                "Recibimos sus comentarios, gracias por utilizar el Sistema de Censos Baja California, seguiremos en contacto. \n GNK Logística SA de CV - Desarrollos WEB 2013");

            // Lo enviamos.
            Transport t = session.getTransport("smtp");
            t.connect("ricardo.wence@gnkl.mx", "ricardo.wence+111");
            t.sendMessage(message, message.getAllRecipients());

            // Cierre.
            t.close();
        } finally {            
            out.close();
        }

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   /* @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(correoGmail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            this.nombre=request.getParameter("txtf_nom");
            this.cuenta_correo=request.getParameter("txtf_cor");
            this.comentario=request.getParameter("txta_com");
            
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(correoGmail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(correoGmail.class.getName()).log(Level.SEVERE, null, ex);
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
