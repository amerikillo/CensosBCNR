/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.co.sneh.model;

import conn.ConectionDB;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Americo
 */
public class FotosEntrevista extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConectionDB con = new ConectionDB();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div style='text-align: center; font-family: Verdana;'>");
        out.println("<img src='imagenes/loading.gif' width='100px' height='100px' align='center' /><br>");
        out.println("Se está finalizando la subida");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
        String Unidad = "";
        boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
        if (isMultiPart) {
            ServletFileUpload upload = new ServletFileUpload();
            try {
                HttpSession sesion = request.getSession(true);
                FileItemIterator itr = upload.getItemIterator(request);
                while (itr.hasNext()) {
                    FileItemStream item = itr.next();
                    if (item.isFormField()) {
                        String fielName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte[] b = new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        //response.getWriter().println(fielName + ":" + value + "<br/>");
                        if (fielName.equals("id_uni")) {
                            Unidad = value;
                        }
                    } else {
                        String path = getServletContext().getRealPath("/");
                        if (FileUpload.processFile(path, item, Unidad)) {
                            try {
                                con.conectar();
                                con.insertar("insert into tb_ima_entrevistas values('" + Unidad + "', '" + item.getName() + "')");
                                con.cierraConexion();
                            } catch (Exception e) {

                            }
                            //response.getWriter().println("file uploaded successfully");
                            sesion.setAttribute("ban", "1");
                            //response.sendRedirect("cargaFotosCensos.jsp");
                        } else {
                            //response.getWriter().println("file uploading falied");
                            //response.sendRedirect("cargaFotosCensos.jsp");
                        }
                    }
                }
            } catch (FileUploadException fue) {
                fue.printStackTrace();
            }

            out.println("<script>alert('Se subieron correctamente las imagenes.')</script>");
            out.println("<script>window.location='capEntrevistaJuris.jsp'</script>");
            //response.sendRedirect("indexCapR.jsp");
        }
    }

}
