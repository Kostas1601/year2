<%--
    Document   : InsertNewMember
    Created on : 18 Μαϊ 2011, 1:06:54 πμ
    Author     : Kostas
--%>

<%@page import="java.lang.Exception"%>
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
                        String Prname = request.getParameter("prname");
                        String Price = request.getParameter("price");
                        String Producer = request.getParameter("producer");
                        String category = request.getParameter("category");
                        String Description = request.getParameter("description");
                        String seller = session.getAttribute("theUserName").toString();
                        String img1 = request.getParameter("image1");
                        String img2 = request.getParameter("image2").toString();
                        String img3 = request.getParameter("image2").toString();
                        String Quantity = request.getParameter("quantity");

                        Connection conn = DriverManager.getConnection("jdbc:odbc:JDBC-ODBC", "p3090148", "16011991");
                        Statement stmt = conn.createStatement();

                        if (img2 == "") {
                            img2 = "null";
                        }
                        if (img3 == "") {
                            img3 = "null";
                        }

                        if (Prname == "" || Price == "" || Producer == "" || Quantity == "" || Description == "") {
                            session.setAttribute("Error", "error");
        %>
        <jsp:forward page="NewItem.jsp"/>
        <%
                                }
                                if (img1 == "") {
                                    img1 = "default.jpg";
                                }


                                stmt.executeQuery("INSERT INTO PRODUCTS(NAME,PRICE,PRODUCER,CATEGORY,RATING,DESCRIPTIONZ,SELLER,PHOTO1,PHOTO2,PHOTO3,QUANTITY)"
                                        + "VALUES ('" + Prname + "'," + Price + ",'" + Producer + "','" + category + "',0,'" + Description + "','" + seller + "','" + img1 + "','" + img2 + "','" + img3 + "'," + Quantity + ")");
                                out.println("INSERT INTO PRODUCTS(NAME,PRICE,PRODUCER,CATEGORY,RATING,DESCRIPTIONZ,SELLER,PHOTO1,PHOTO2,PHOTO3,QUANTITY)"
                                        + "VALUES ('" + Prname + "','" + Price + "','" + Producer + "','" + category + "',0,'" + Description + "'," + seller + "," + img1 + "," + img2 + "," + img3 + "," + Quantity + ")");


                                conn.close();
                            } catch (Exception e) {
                                out.println("<h2>Exception: " + e.toString() + "</h2>");%>
        <jsp:forward page="ItemAdded.jsp"/>
        <%
                    }
        %>
    </body>
</html>
