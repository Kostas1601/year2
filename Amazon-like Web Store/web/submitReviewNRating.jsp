<%--
    Document   : InsertNewMember
    Created on : 18 Μαϊ 2011, 1:06:54 πμ
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
    <%@ page language="java" import="java.sql.*"%>
    <body>
        <%
                    try {
                        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                    } catch (ClassNotFoundException e) {
                        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>");
                    }
                    try {


                        Connection conn = DriverManager.getConnection("jdbc:odbc:JDBC-ODBC", "p3090148", "16011991");
                        Statement stmt = conn.createStatement();
                        ResultSet rs;

                        rs = stmt.executeQuery("SELECT * FROM PRODUCTS WHERE PRODUCTID =" + session.getAttribute("prid"));

                        while (rs.next()) {
                            String rating = rs.getString(6);
                            session.setAttribute("rating", rating);
                        }
                        int Final = 0;
                        String Rating = request.getParameter("Rating");
                        String ratingz = session.getAttribute("rating").toString();
                        Integer rat = (int) Integer.parseInt(ratingz);
                        session.setAttribute("rat", rat);
                        int rat2 = (int) Integer.parseInt(Rating);
                        session.setAttribute("rat2", rat2);
                        if (rat == 0) {
                            Final = rat2;
                        }
                        else{
                        Final = (int) Math.ceil(((double) rat + (double) rat2) / 2);}
                        session.setAttribute("Final", Final);
                        session.setAttribute("ratingz", Final);

                        stmt.executeQuery("UPDATE PRODUCTS SET RATING = " + Final + " WHERE PRODUCTID = " + session.getAttribute("prid"));


        %>

        <%
                            } catch (Exception e) {

                                out.println("<h2>Exception: " + e.getMessage() + "</h2>");
                                session.setAttribute("Exception", e.toString());
                                String Review = request.getParameter("Review");
                                if (Review.compareTo("") != 0) {
                                    try {


                                        String Usern = session.getAttribute("theUserName").toString();
                                        session.setAttribute("Review", Review);

                                        Connection conn = DriverManager.getConnection("jdbc:odbc:JDBC-ODBC", "p3090148", "16011991");
                                        Statement stmt = conn.createStatement();

                                        stmt.executeQuery("INSERT INTO REVIEWZ (PRODUCTID,REVIEW,UserR)"
                                                + "VALUES ('" + session.getAttribute("prid") + "','" + Review + "','" + Usern + "')");
                                    } catch (Exception ex) {
        %>
        <jsp:forward page="reviewNratingRedirect.jsp"/>
        <%                        }
                        }
                    }
        %>
        <jsp:forward page="reviewNratingRedirect.jsp"/>

    </body>
</html>
