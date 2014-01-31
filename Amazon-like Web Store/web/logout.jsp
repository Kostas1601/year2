<%-- 
    Document   : logout
    Created on : 18 Μαϊ 2011, 8:29:53 μμ
    Author     : Kostas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NeiLon</title>
    </head>
    <body>
        <%
        session.invalidate();
response.sendRedirect("index.jsp");
%>

    </body>
</html>
