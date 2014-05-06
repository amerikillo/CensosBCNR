/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;

import conn.ConectionDB;
import java.sql.SQLException;

/**
 *
 * @author Amerikillo
 */
public class CapCensos {

    ConectionDB con = new ConectionDB();

    public void Captura(String id_uni, String tipo, String gnombre_gnk, String juris, String fecha, String hora, String encuestador, String muni, String clues, String prueba) throws SQLException {
        try {
            byte[] a;
            //a = tipo.getBytes("ISO-8859-1");
            tipo = new String(tipo.getBytes("ISO-8859-1"), "UTF-8");
            gnombre_gnk = new String(gnombre_gnk.getBytes("ISO-8859-1"), "UTF-8");
            juris = new String(juris.getBytes("ISO-8859-1"), "UTF-8");
            encuestador = new String(encuestador.getBytes("ISO-8859-1"), "UTF-8");
            muni = new String(muni.getBytes("ISO-8859-1"), "UTF-8");
            clues = new String(clues.getBytes("ISO-8859-1"), "UTF-8");
        } catch (Exception e) {
        }
        con.conectar();
        try {
            con.insertar("insert into tb_registro_censos values ('" + id_uni + "', '" + encuestador + "', NOW(), 'INICIO');");
            con.insertar("insert into tb_a (id_uni, campo_5, campo_1, campo_11, campo_12, campo_13, campo_15, campo_7) values('" + id_uni + "', '" + muni + "', '" + gnombre_gnk + "', '" + juris + "', 'BAJA CALIFORNIA', '" + muni + "', '" + tipo + "', '" + clues + "')");
            con.insertar("insert into tb_b (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_c (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_d (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_e (id_uni) values ('" + id_uni + "')");
            con.insertar("insert into tb_f values ('" + id_uni + "', '')");
        } catch (SQLException e) {
            try {
                con.actualizar("update tb_a set campo_5 = '" + muni + "', campo_1 = '" + gnombre_gnk + "', campo_11 = '" + juris + "', campo_12 = '" + muni + "', CAMPO_13='" + muni + "', campo_15 = '" + tipo + "', campo_7='" + clues + "' where id_uni = '" + id_uni + "' ");
            } catch (Exception ex) {
            }
        }
        try {
            con.insertar("insert into tb_b (id_uni) values ('" + id_uni + "')");
        } catch (Exception e) {
        }
        try {
            con.insertar("insert into tb_c (id_uni) values ('" + id_uni + "')");
        } catch (Exception e) {
        }
        try {
            con.insertar("insert into tb_d (id_uni) values ('" + id_uni + "')");
        } catch (Exception e) {
        }
        try {
            con.insertar("insert into tb_e (id_uni) values ('" + id_uni + "')");
        } catch (Exception e) {
        }
        try {
            con.insertar("insert into tb_f values ('" + id_uni + "', '')");
        } catch (Exception e) {
        }
        try {
            System.out.println(prueba);
            if (prueba.equals("on")) {
                con.insertar("insert into tb_prueba values ('" + id_uni + "', 'P')");
            }

        } catch (Exception e) {
        }

        try {
            if (prueba == null) {
                con.insertar("delete from tb_prueba where id_uni='" + id_uni + "' ");
            }
        } catch (Exception e) {
        }

        con.cierraConexion();
    }
}
