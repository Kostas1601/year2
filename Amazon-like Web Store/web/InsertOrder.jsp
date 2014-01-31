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
                        String Prid = session.getAttribute("prid").toString();
                        String Buyer = session.getAttribute("theUserName").toString();
                        String Quant = session.getAttribute("Quant").toString();
                        String Prname = session.getAttribute("name").toString();

                        String Seller = session.getAttribute("seller").toString();
                        String FinalPrice = session.getAttribute("FinalPrice").toString();

                        Connection conn = DriverManager.getConnection("jdbc:odbc:JDBC-ODBC", "p3090148", "16011991");
                        Statement stmt = conn.createStatement();

                        out.println("INSERT INTO PARAGELIES(PRODUCTID,BUYER,ORDERQUANTITY,PRODUCTNAME,SELLERNAME,ORDERPRICE) "
                                + "VALUES (" + Prid + ",'" + Buyer + "'," + Quant + ",'" + Prname + "','" + Seller + "'," + FinalPrice + ")");

                        stmt.executeQuery("INSERT INTO PARAGELIES(PRODUCTID,BUYER,ORDERQUANTITY,PRODUCTNAME,SELLERNAME,ORDERPRICE)"
                                + "VALUES (" + Prid + ",'" + Buyer + "'," + Quant + ",'" + Prname + "','" + Seller + "'," + FinalPrice + ")");

                        conn.close();
                    } catch (Exception e) {
                        out.println("<h2>Exception: " + e.toString() + "</h2>");

                        response.sendRedirect("OrderConfirmed.jsp");
                    }
        %>
    </body>
</html>
