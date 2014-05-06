<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    response.sendRedirect("indexCapR.jsp");
%>