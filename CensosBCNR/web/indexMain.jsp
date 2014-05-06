<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*"  session="true" errorPage="" %>
<%@ page import="clasesJava.*" %>
<%@ page import="conn.*" %>
<%
    //----------------------------------Modulo de Sesiones
    HttpSession sesion = request.getSession();
    String val = "", user = "", id = "";
    session.getId();
    if (sesion.getAttribute("valida") != null) {
        val = (String) sesion.getAttribute("valida");
        user = (String) sesion.getAttribute("nombre");
        id = (String) sesion.getAttribute("id");
        //out.print(user+" "+val+" "+id);
    }
    if (!val.equals("valida")) {
        //response.sendRedirect("index.jsp");
    }
//out.print (val+user+id+session.getId());
//--------------------------------------------------------

    String date = "";

    int tam_cen = 0, tam_pic = 0, tam_inv = 0;
    Fechas objF = new Fechas();
    ClasesProc objR = new ClasesProc();
    date = objF.regresaFecha();
    tam_cen = objR.regresaCont();


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>:: MENU CENSOS ::</title>
        <script language="javascript" src="js/code_js.js"></script>
        <script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
            <style type="text/css">
                .neg {
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 10px;
                    font-weight: bold;
                    color: #666;
                }
                .der {
                    text-align: center;
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 16px;
                    font-weight: bold;
                }
                .center1 {
                    text-align: center;
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 12px;
                    font-weight: bold;
                }
                .colorin {
                    color: #900;
                }
            </style>

    </head>

    <body onLoad="show5()">
        <table width="566" height="218" border="1" align="center">
            <tr>
                <td><table width="550" border="0">
                        <tr>
                            <td colspan="3" align="left"><img src="imagenes/Logo GNK claro2.jpg" width="100" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center"><img src="imagenes/censos_tit.png"  />  </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="der">Fecha:&nbsp;<%=date%>&nbsp;&nbsp;&nbsp;&nbsp;Hora:<span id="liveclock"></span>
                                <br> Bienvenido <label class="glyphicon glyphicon-user"></label>&nbsp;&nbsp;<%=user%>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">&nbsp;</td>
                            <td width="250" align="center"><h4><a href="http://166.78.128.202:8080/CensosBCNH/consultaCensosH.jsp"><strong>Consulta de Censos y Pictogr&aacute;ficos de Hospitales</strong></a></h4></td>

                        </tr>
                        <tr>
                            <td align="center">&nbsp;</td>
                            <td width="250" align="center"><h4><a href="http://166.78.128.202:8080/CensosBCNR/consultaCensosR.jsp"><strong>Consulta de Censos y Pictogr&aacute;ficos de Unidades Rurales</strong></a></h4></td>

                        </tr>
                        <tr>
                            <td align="center">&nbsp;</td>
                            <td width="250" align="center"><h4><a href="http://166.78.128.202:8080/CensosBCNR/consultaJuris.jsp"><strong>Consulta de Jurisdicciones</strong></a></h4></td>

                        </tr>
                        <tr>
                            <td></td>
                            <td width="250" align="center"><h4><a href="http://166.78.128.202:8080/CensosBCNR/conEntrevistaJuris.jsp"><strong>Consulta de Entrevistas a Jurisdicciones</strong></a></h4></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td width="250" align="center"><h4><a href="http://166.78.128.202:8080/InventariosBCN/index.jsp"><strong>Consulta de Inventarios</strong></a></h4></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="center1">&nbsp;</td>
                            <td align="center">Total de Censos:<span class="colorin"> <%=tam_cen%></span></td>
                            <td align="center">&nbsp;<!--span class="center1">Total de Pictogr&aacute;ficos:<span class="colorin"> <%//=tam_inv%></span></span--></td>
                        </tr>
                        <tr>
                            <td width="198" >&nbsp;</td>
                            <td width="128" align="center" ><form action="indexMain.jsp" method="post" name="form"><input name="submit" type="submit"  value="Actualizar" class="btn btn-primary btn-md btn-block" /></form></td>
                            <td width="210" >&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="369" height="185" id="FlashID" title="">
                                    <param name="movie" value="imagenes/flash1_ver.swf" />
                                    <param name="quality" value="high" />
                                    <param name="wmode" value="opaque" />
                                    <param name="swfversion" value="6.0.65.0" />
                                    <!-- This param tag prompts users with Flash Player 6.0 r65 and higher to download the latest version of Flash Player. Delete it if you don’t want users to see the prompt. -->
                                    <param name="expressinstall" value="Scripts/expressInstall.swf" />
                                    <!-- Next object tag is for non-IE browsers. So hide it from IE using IECC. -->
                                    <!--[if !IE]>-->
                                    <object type="application/x-shockwave-flash" data="imagenes/banner1.swf" width="369" height="185">
                                        <!--<![endif]-->
                                        <param name="quality" value="high" />
                                        <param name="wmode" value="opaque" />
                                        <param name="swfversion" value="6.0.65.0" />
                                        <param name="expressinstall" value="Scripts/expressInstall.swf" />
                                        <!-- The browser displays the following alternative content for users with Flash Player 6.0 and older. -->
                                        <div>
                                            <h4>Content on this page requires a newer version of Adobe Flash Player.</h4>
                                            <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" width="112" height="33" /></a></p>
                                        </div>
                                        <!--[if !IE]>-->
                                    </object>
                                    <!--<![endif]-->
                                </object></td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center"></td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center"><strong class="neg">DERECHOS RESERVADOS GNKL/DESARROLLOS WEB &reg; 2009 - 2014</strong></td>
                        </tr>
                    </table></td>
            </tr>
        </table>

        <script type="text/javascript">
            swfobject.registerObject("FlashID");
        </script>
    </body>
</html>
