<%-- 
    Document   : reviewNratingRedirect
    Created on : 1 Ιουν 2011, 10:51:47 πμ
    Author     : p3090148
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NeiLon</title>
    </head>
    <body><%

                String title = session.getAttribute("name").toString();
                String price = session.getAttribute("price").toString();
                String producer = session.getAttribute("producer").toString();
                String prid = session.getAttribute("prid").toString();
                String desc = session.getAttribute("description").toString();
                String seller = session.getAttribute("seller").toString();
                String img1 = session.getAttribute("img1").toString();
                String img2 = session.getAttribute("img2").toString();
                String img3 = session.getAttribute("img3").toString();
                String quantity = session.getAttribute("quantity").toString();
                String ratingz = session.getAttribute("ratingz").toString();

                response.sendRedirect("SpecificItem.jsp?name=" + title + "&price=" + price + "&producer=" + producer + "&prid=" + prid+ "&rating=" + ratingz + "&description=" + desc + "&seller=" + seller + "&img1=" + img1 + "&img2=" + img2 + "&img3=" + img3 + "&quantity=" + quantity );
            %>
    
       
    </body>
</html>
