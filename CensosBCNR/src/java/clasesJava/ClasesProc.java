/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;
import conn.*;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author wence
 */
public class ClasesProc {
    private String SQLEx;
    private int censos;
    private boolean exito;
    ConectionDB objC= new ConectionDB();
    
    
    public int regresaCont() {
        try {
            objC.conectar();
            String qry_cons = "select count(ta.id_uni) as cen from tb_unidades t, tb_a ta where t.id_uni = ta.id_uni and ta.campo_31!='';";
            ResultSet consulta = null;
            consulta = objC.consulta(qry_cons);
            if (consulta.next()) {
                exito = true;
                censos = consulta.getInt("cen");

            }
            objC.cierraConexion();
        } catch (SQLException ex) {
            this.SQLEx = "Se produjo una excepción durante la conexión: " + ex.toString();

        }
    return censos;
  }


}//end of class
