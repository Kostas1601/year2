<%--
    Document   : index
    Created on : 14 Μαϊ 2011, 3:34:00 μμ
    Author     : Kostas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <%@ page language="java" import="java.sql.*"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>NeiLon</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <!--[if IE 6]>
        <link rel="stylesheet" type="text/css" href="iecss.css" />
        <![endif]-->
        <script type="text/javascript" src="js/boxOver.js"></script>
    </head>
    <body>

        <div id="main_container">

            <div id="header">

                <div class="top_right">

                    <div class="languages"></div>

                    <div class="big_banner">
                        <a href="#"><img src="images/banner728.jpg" alt="" title="" border="0" /></a>
                    </div>

                </div>


                <div id="logo">
                    <a href="index.jsp"><img src="images/logo.png" alt="" title="" border="0" width="182" height="85" /></a>
                </div>




            </div>

            <div id="main_content">

                <div id="menu_tab">
                    <ul class="menu">
                        <li><a href="index.jsp" class="nav">  Home </a></li>
                        <li class="divider"></li>
                        <li><a href="advsearch.jsp" class="nav">Advanced Search</a></li>
                        <li class="divider"></li>
                        <li><a href="terms.jsp" class="nav">Terms Of Use</a></li>
                        <li class="divider"></li>
                        <%if (session.getAttribute("theUserName") != null) {
                                        out.println("<li><a href=\"myaccount.jsp\" class=\"nav\">My Account</a></li><li class=\"divider\"></li>");
                                    }
                        %>
                        <li><a href="signup.jsp" class="nav">Sign Up</a></li>
                        <li class="divider"></li>
                        <li><a href="about.jsp" class="nav">About Neilon </a></li>
                        <li class="divider"></li>
                        <li><a href="contact.jsp" class="nav">Contact Us</a></li>

                    </ul>

                </div><!-- end of menu tab -->

                <div class="left_content">
                  <div class="title_box">Categories</div>

                    <ul class="left_menu">
                        <li class="odd">
                            <a href="ShowCategory.jsp?category=Books">Books</a>
                        </li>
                        <li class="even"><a href="ShowCategory.jsp?category=Toys">Toys</a></li>
                        <li class="odd"><a href="ShowCategory.jsp?category=Electronics">Electronics</a></li>
                        <li class="even"><a href="ShowCategory.jsp?category=Gaming">Gaming</a></li>
                        <li class="odd"><a href="ShowCategory.jsp?category=Clothes">Clothes</a></li>
                        <li class="even"><a href="ShowCategory.jsp?category=Movies">DVDs/BluRay Movies</a></li>
                        <li class="odd"><a href="ShowCategory.jsp?category=Mobiles">Mobiles</a></li>
                        <li class="even"><a href="ShowCategory.jsp?category=Music">Music</a></li>
                        <li class="odd"><a href="ShowCategory.jsp?category=Collectibles">Collectibles</a></li>
                        <li class="even"><a href="ShowCategory.jsp?category=Sports">Sports</a></li>
                        <li class="odd"><a href="ShowCategory.jsp?category=Computers">Computers and Networking</a></li>
                        <li class="even"><a href="ShowCategory.jsp?category=Home">Home Products</a></li>
                    </ul>





                    <div class="banner_adds">
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

                                        rs = stmt.executeQuery("SELECT TOP 1 * FROM ADVERTISEMENTS ORDER BY NEWID()");

                                        while (rs.next()) {
                                            String ADImage = rs.getString("ADURL");
                        %>
                        <img src="images/<%=ADImage%>" alt="" title="" border="0" width="120" height="224"/>
                        <%
                                        }
                                    } catch (Exception e) {
                                        out.println("<h2>Exception: " + e.getMessage() + "</h2>");
                                    }
                        %>

                    </div>


                </div><!-- end of left content -->



                <div class="center_content">
                    <% //String Prname = session.getAttribute("name").toString();
                                String Quant = request.getParameter("selQuant");
                                session.setAttribute("Quant", Quant);
                                // String Prid = session.getAttribute("prid").toString();
                                String Buyer = session.getAttribute("theUserName").toString();
                                // String Seller = session.getAttribute("seller").toString();
                                String UPrice = session.getAttribute("price").toString();

                                Double FinalPrice = Double.parseDouble(UPrice) * Integer.parseInt(Quant);
                                session.setAttribute("FinalPrice", FinalPrice);
                    %>
                    <h2><font color="ORANGE">The Total Price of your Order is: <%out.println(FinalPrice + "$");%>

                        </font></h2>
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
                                        rs = stmt.executeQuery("SELECT * FROM  XRHSTES WHERE USERNAME = '" + Buyer + "'");

                                        while (rs.next()) {
                                            String Name = rs.getString("ONOMA");
                                            String SurName = rs.getString("EPONYMO");
                                            String Street = rs.getString("ODOS");
                                            String Num = rs.getString("ARITHMOS");
                                            String City = rs.getString("POLH");
                                            String Zip = rs.getString("TAXKOD");
                                            String Country = rs.getString("XWRA");
                        %>
                    <h3><font color="GREEN"><i>Your Order Will Be Shipped to this Adress: <br>
                                <%=Name%> <%=SurName%>
                                <p></p>
                                <%=Num%> <%=Street%>St.
                                <p></p>
                                <%=City%> <%=Zip%>
                                <p></p>
                                <%=Country%>
                  </i></font></h3>
                            <%
                                            }
                                        } catch (Exception e) {
                                            out.println("<h2>Exception: " + e.toString() + "</h2>");
                                            //  response.sendRedirect(".jsp");
                                        }
                            %>
                    <h3><font color="RED"><i>Are You Absolutely Sure You want to Continue?</i></font></h3>
                    <FORM METHOD="LINK" ACTION="InsertOrder.jsp">
                        <INPUT TYPE="submit" VALUE="YES">
                    </FORM>

                </div><!-- end of center content -->



                <div class="right_content">

                    <div class="title_box">Search</div>
                    <div class="border_box">

                        <form method= "POST" action="results.jsp" id="searchForm">
                            <p>
                                <input type="text" name="normsearch" class="newsletter_input" value="keyword"/>
                                <input type="submit" class="prod_details" value="Search"/></p>
                        </form>
                    </div>





                    <div class="Login">
                        <% if (session.getAttribute("theUserName") == null) {
                                        out.print("<div class=\"title_box\">Login</div>\n<form method= \"POST\" action=\"SearchUser.jsp\" id=\"loginForm\">\nUsername: <input name=\"USERNAME\" type=\"text\" size=\"20\"><br>\nPassword: <input name=\"PASSWD\"            "
                                                + " type=\"password\"  size=\"20\"/><br>"
                                                + "\n"
                                                + "\n<input type=\"submit\" value=\"Login\">\n"
                                                + "</form>");
                                    } else {
                                        out.print("<div class=\"title_box\">Logged In As</div>"
                                                + "\n<div class=\"oferta_title\">"
                                                + "<p><em><a href=\"myaccount.jsp\">" + session.getAttribute("theUserName") + "</a></em> </p>"
                                                + "<p><a href=\"logout.jsp\" class=\"join\">logout </a></p>");
                                    }
                        %>
                    </div>


                    <div class="title_box">What’s new</div>
                    <div class="border_box">
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

                                        rs = stmt.executeQuery("SELECT TOP 1 * FROM PRODUCTS WHERE DATEDIFF(DAY,UPLOADDATE,GETDATE())=0 ORDER BY NEWID()");

                                        while (rs.next()) {
                                            String title = rs.getString("NAME");
                                            String price = rs.getString("PRICE");
                                            String producer = rs.getString("PRODUCER");
                                            String prid = rs.getString("PRODUCTID");
                                            String rating = rs.getString("RATING");
                                            String desc = rs.getString("DESCRIPTIONZ");
                                            String seller = rs.getString("SELLER");
                                            String img = rs.getString("PHOTO1");
                                            String img2 = rs.getString("PHOTO2");
                                            String img3 = rs.getString("PHOTO3");
                                            String quantity = rs.getString("QUANTITY");
                                            out.println("<div class=\"product_title\"><a href=\"SpecificItem.jsp?name=" + title + "&price=" + price + "&producer=" + producer + "&prid=" + prid + "&rating=" + rating + "&description=" + desc + "&seller=" + seller + "&img1=" + img + "&img2=" + img2 + "&img3=" + img3 + "&quantity=" + quantity + "\">" + title + "</a></div>"
                                                    + "<div class=\"product_img\"><a href=\"SpecificItem.jsp?name=" + title + "&price=" + price + "&producer=" + producer + "&prid=" + prid + "&rating=" + rating + "&description=" + desc + "&seller=" + seller + "&img1=" + img + "&img2=" + img2 + "&img3=" + img3 + "&quantity=" + quantity + "\"><img src=\"images/" + img + "\" width=\"165\" height=\"113\" alt=\"\" title=\"\" border=\"0\" /></a></div>"
                                                    + "<div class=\"prod_price\"><span class=\"price\">" + price + "$</span></div>");
                                        }

                                        conn.close();
                                    } catch (Exception e) {
                                        out.println("<h2>Exception: " + e.getMessage() + "</h2>");
                                    }

                        %>
                    </div>






                </div><!-- end of right content -->



            </div><!-- end of main content -->



            <div class="footer">


                <div class="left_footer">
                    <img src="images/footer_logo.png" alt="" title="" width="89" height="42"/>
                </div>

                <div class="center_footer">
                    Team Neilon. All Rights Reserved 2011
                    <br />
                    <img src="images/payment.gif" alt="" title="" />
                </div>

                <div class="right_footer">
                    <a href="index.jsp">home</a>
                    <a href="about.jsp">about</a><a href="contact.jsp">contact us</a>
                </div>

            </div>


        </div>
        <!-- end of main_container -->
    </body>
</html>

