<%-- 
    Document   : SearchUser
    Created on : 12 Μαϊ 2011, 3:12:55 μμ
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
        <%@ page language="java" import="java.sql.*"%>
    <head>
        <title> Search </title>
    </head>
    <body bgcolor>
        <%
                    try {
                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    } catch (ClassNotFoundException e) {
                        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>");
                    }
                    try {
                        String UsrN = request.getParameter("USERNAME");
                        String PassW = request.getParameter("PASSWD");
                        Connection conn = DriverManager.getConnection("jdbc:odbc:JDBC-ODBC", "p3090148", "16011991");
                        Statement stmt = conn.createStatement();
                        ResultSet rs;
                       
                        rs = stmt.executeQuery("SELECT * FROM XRHSTES where USERNAME = '"+UsrN+"' AND PASSWD ='"+PassW+"'");

                       
                        
                        int count = 0;
                        while (rs.next()) {
    
                            session.setAttribute("theUserName", rs.getString(1));
                            session.setAttribute("thePassWD", rs.getString(4));
                            count++;
                        }
                        if (count > 0) {
                            response.sendRedirect("welcome.jsp");
                       }
                        else {
                           session.setAttribute("usernotfound","true");
                           response.sendRedirect("welcome.jsp");
                        }

                        //conn.close();
                    } catch (Exception e) {
                        out.println("<h2>Exception: " + e.getMessage() + "</h2>");
                    }
        %>
    </body>
</html>

</body>
</html>
