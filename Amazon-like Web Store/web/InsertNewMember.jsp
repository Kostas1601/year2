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
                        String UsrN = request.getParameter("usrname");
                        String Name = request.getParameter("name");
                        String Lname = request.getParameter("lname");
                        String Email = request.getParameter("email");
                        String Passw = request.getParameter("passw");
                        String Phone = request.getParameter("phone");
                        String Street = request.getParameter("street");
                        String Numb = request.getParameter("numb");
                        String City = request.getParameter("city");
                        String Birthyear = request.getParameter("birthyear");
                        String Birthmonth = request.getParameter("birthmonth");
                        String Birthday = request.getParameter("birthday");
                        String Zip = request.getParameter("zip");
                        String Country = request.getParameter("selCountry");                                       
                        
                        session.setAttribute("FirstName", Name);
                        session.setAttribute("LastName", Lname);
                        
                        Connection conn = DriverManager.getConnection("jdbc:odbc:JDBC-ODBC", "p3090148", "16011991");
                        Statement stmt = conn.createStatement();

                        if(UsrN == "" || Name == "" || Lname == "" || Email == "" || Passw == "" || Phone == "" || Street == "" || Numb == "" || City == "" || Zip == ""  ){
                            session.setAttribute("Error","error");                            
                   %>

                            <jsp:forward page ="signup.jsp"/>
        <%
                        }


                        stmt.executeQuery("INSERT INTO XRHSTES(USERNAME,ONOMA,EPONYMO,PASSWD,PHONE,ODOS,ARITHMOS,POLH,TAXKOD,XWRA,BIRTHDATE,EMAIL,AVATARPIC,WARNING)"+
                                "VALUES ('"+UsrN+"','"+Name+"','"+Lname+"','"+Passw+"','"+Phone+"','"+Street+"',"+Numb+",'"+City+"',"+Zip+",'"+Country+"','"+Birthyear+"-"+Birthmonth+"-"+Birthday+"','"+Email+"',null,0)");
                                out.println("INSERT INTO XRHSTES(USERNAME,ONOMA,EPONYMO,PASSWD,PHONE,ODOS,ARITHMOS,POLH,TAXKOD,XWRA,BIRTHDATE,EMAIL,AVATARPIC,WARNING)"+
                                "VALUES ('"+UsrN+"','"+Name+"','"+Lname+"','"+Passw+"','"+Phone+"','"+Street+"',"+Numb+",'"+City+"',"+Zip+",'"+Country+"','"+Birthyear+"-"+Birthmonth+"-"+Birthday+"','"+Email+"',null,0)");
                                               
                        
                                conn.close();
                            
                       %>
                        <jsp:forward page ="accreated.jsp"/>
                        <%                        

                        
                    } catch (Exception e) {
                        out.println("<h2>Exception: " + e.getMessage() + "</h2>");                       
                        %>
                        <jsp:forward page ="accreated.jsp"/>
                        <%
                    }
        %>
    </body>
</html>
