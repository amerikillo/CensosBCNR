/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;

/**
 *
 * @author wence
 */
public class Fechas {
    private String date,res;
    private int day, month, year;
    
    public String regresaFecha(){
        // add 1 to month because Calendar's months start at 0, not 1
        java.util.Calendar currDate = new java.util.GregorianCalendar();
        int month = currDate.get(currDate.MONTH)+1;
        int day = currDate.get(currDate.DAY_OF_MONTH);
        int year = currDate.get(currDate.YEAR);
        if(month >=1 && month <= 9){
              res ="0"+month;
              date=" "+day;
              date= date+"/"+res;
              date= date+"/"+year;  
         }
        else{
              date=" "+day;
              date= date+"/"+month;
              date= date+"/"+year;  
              res+=month;
           }
        return date;
    }
    
}// end of class
