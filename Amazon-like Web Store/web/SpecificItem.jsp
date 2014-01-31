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

                                       rs = stmt.executeQuery("SELECT * FROM ADVERTISEMENTS WHERE ADTHEME= '" + session.getAttribute("category")+"'");

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

                    <%      //parameters of specific item -> session
                                String name = request.getParameter("name");
                                session.setAttribute("name", name);

                                String price = request.getParameter("price");
                                session.setAttribute("price", price);
                                String producer = request.getParameter("producer");
                                session.setAttribute("producer", producer);
                                String prid = request.getParameter("prid");
                                session.setAttribute("prid", prid);
                                String rating = request.getParameter("rating");
                                session.setAttribute("rating", rating);
                                String description = request.getParameter("description");
                                session.setAttribute("description", description);

                                String seller = request.getParameter("seller");
                                session.setAttribute("seller", seller);
                                String img1 = request.getParameter("img1");
                                session.setAttribute("img1", img1);
                                String img2 = request.getParameter("img2");
                                session.setAttribute("img2", img2);
                                String img3 = request.getParameter("img3");
                                session.setAttribute("img3", img3);
                                String quantity = request.getParameter("quantity");
                                session.setAttribute("quantity", quantity);


                                out.print("<div class=\"center_title_bar\">" + name + "</div>"
                                        + "<div class=\"prod_box_big\">"
                                        + "<div class=\"center_prod_box_big\">"
                                        + "<div class=\"product_img_big\">"
                                        + "<img src=\"images/" + img1 + "\" width=\"180\" height=\"200\" alt=\"\" title=\"\" border=\"0\" />");

                                if (img2 != null | img3 != null) {
                                    if (img2.compareTo("null") != 0 || img3.compareTo("null") != 0) {
                                        out.println("<div class=\"thumbs\">");
                                        if (img2 != null) {
                                            out.println("<img src=\"images/" + img2 + "\" width=\"40\" height=\"40\" alt=\"\" title=\"\" border=\"0\" />");
                                        }
                                        if (img3 != null) {
                                            out.println("<img src=\"images/" + img3 + "\" width=\"40\" height=\"40\" alt=\"\" title=\"\" border=\"0\" />");
                                        }
                                        out.println("</div>");

                                    }

                                }

                                out.println("</div>");

                                out.println(
                                        "<div class=\"details_big_box\">"
                                        + " <div class=\"product_title_big\">" + name + "</div>"
                                        + " <div class=\"specifications\">"
                                        + "Available Quantity: <span class=\"blue\">" + quantity + "</span><br />"
                                        + "Producer: <span class=\"blue\">"
                                        + " " + producer + "</span><br />"
                                        + "Seller: <span class=\"blue\">"
                                        + " " + seller + "</span><br />"
                                        + " Description :<span class=\"blue\">" + description + "</span><br />"
                                        + "</div>"
                                        + "<div class=\"prod_price_big\"> <span class=\"price\">" + price + "$</span></div>");
                                if (session.getAttribute("theUserName") != null) {
                                    if (session.getAttribute("theUserName").toString().compareTo(seller) != 0) {
                                        out.println(" <a href=\"ConfirmOrder.jsp?name=" + name + "&price=" + price + "&producer=" + producer + "&rating=" + rating + "&description=" + description + "&seller=" + seller + "&img1=" + img1 + "&quantity=" + quantity + "\" class=\"prod_buy\">Buy</a>");
                                    }
                                } else {
                                    out.println("<font color=\"Green\"><i>Sign Up or Login to Buy and/or Write a review for this item</i></font>");
                                }
                                out.println("</div>"
                                        + "  </div>"
                                        + "  </div>");
                                out.println("<div class=\"thumbs\">");
                                out.println("Rating:");
                                if (rating.compareTo("0") == 0) {
                                    out.println("Noone has rated this product yet");
                                }
                                if (rating.compareTo("1") == 0) {
                                    out.println("<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />");
                                }
                                if (rating.compareTo("2") == 0) {
                                    out.println("<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />");
                                }
                                if (rating.compareTo("3") == 0) {
                                    out.println("<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />");
                                }
                                if (rating.compareTo("4") == 0) {
                                    out.println("<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />");
                                }
                                if (rating.compareTo("5") == 0) {
                                    out.println("<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />" + "<img src=\"images/ratstar.jpg\"\" alt=\"\" title=\"\" border=\"0\" />");
                                }
                                out.println("</div>");

                    %>
                    <div class="center_title_bar">Reviews</div>
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

                                    rs = stmt.executeQuery("SELECT * FROM REVIEWZ WHERE PRODUCTID =" + prid);

                                    while (rs.next()) {
                                        String review = rs.getString("REVIEW");
                                        String UserR = rs.getString("UserR");


                                        out.println("<div class=\"prod_box_big\"><div class=\"center_prod_box_big\">");
                                        out.println("<h3 align=\"left\"><font color=\"Green\"><u><b><i>" + UserR + ":</i></b></u></font></h3>");
                                        out.println("<br>");
                                        out.println(" <div class=\"specifications\"><i>\"" + review + "\"</i></div>");
                                        out.println("</div> </div>");
                                    }
                                } catch (Exception e) {
                                    out.println("<h2>Exception: " + e.getMessage() + "</h2>");
                                }
                    %>
                    <script language = "Javascript">
                        /**
                         * DHTML textbox character counter script. Courtesy of SmartWebby.com (http://www.smartwebby.com/dhtml/)
                         */

                        maxL=500;
                        var bName = navigator.appName;
                        function taLimit(taObj) {
                            if (taObj.value.length==maxL) return false;
                            return true;
                        }

                        function taCount(taObj,Cnt) {
                            objCnt=createObject(Cnt);
                            objVal=taObj.value;
                            if (objVal.length>maxL) objVal=objVal.substring(0,maxL);
                            if (objCnt) {
                                if(bName == "Netscape"){
                                    objCnt.textContent=maxL-objVal.length;}
                                else{objCnt.innerText=maxL-objVal.length;}
                            }
                            return true;
                        }
                        function createObject(objId) {
                            if (document.getElementById) return document.getElementById(objId);
                            else if (document.layers) return eval("document." + objId);
                            else if (document.all) return eval("document.all." + objId);
                            else return eval("document." + objId);
                        }
                    </script>

                    <%

                                if (session.getAttribute("theUserName") != null && session.getAttribute("theUserName").toString().compareTo(seller) != 0) {
                    %>


                    <div class="product_title_big">

                        <div class="form_row">
                            <form method= "POST" action="submitReviewNRating.jsp" id="ReviewForm">
                                <label class="contact"><strong>Review</strong></label>
                                <textarea onKeyPress="return taLimit(this)" onKeyUp="return taCount(this,'myCounter')" name="Review" rows=7 wrap="physical" cols=40></textarea>
                                <B><SPAN id=myCounter>500</SPAN></B> characters remaining
                                <br>
                                <label class="contact"><strong>Rating:</strong></label>
                                <select id="country" name="Rating">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>

                                <input type="submit" value="Submit">
                            </form>

                        </div>
                    </div><%}
                                //  out.println(session.getAttribute("Rating"));
                                // out.println(session.getAttribute("Final"));

                    %>

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


                    <div class="title_box">You Might Also Like</div>
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

                                        rs = stmt.executeQuery("SELECT TOP 1 * FROM PRODUCTS WHERE PRODUCTID =" + prid);
                                        while (rs.next()) {
                                            String Category = rs.getString("CATEGORY");
                                            session.setAttribute("Category", Category);
                                        }
                                        rs = stmt.executeQuery("SELECT TOP 1 * FROM PRODUCTS WHERE CATEGORY = '" + session.getAttribute("Category") + "' ORDER BY NEWID()");

                                        while (rs.next()) {
                                            String title = rs.getString("NAME");
                                            String pricee = rs.getString("PRICE");
                                            String producere = rs.getString("PRODUCER");
                                            String pride = rs.getString("PRODUCTID");
                                            String ratinge = rs.getString("RATING");
                                            String desc = rs.getString("DESCRIPTIONZ");
                                            String sellere = rs.getString("SELLER");
                                            String img = rs.getString("PHOTO1");
                                            String img2e = rs.getString("PHOTO2");
                                            String img3e = rs.getString("PHOTO3");
                                            String quantitye = rs.getString("QUANTITY");
                                            out.println("<div class=\"product_title\"><a href=\"SpecificItem.jsp?name=" + title + "&price=" + pricee + "&producer=" + producere + "&prid=" + pride + "&rating=" + ratinge + "&description=" + desc + "&seller=" + sellere + "&img1=" + img + "&img2=" + img2e + "&img3=" + img3e + "&quantity=" + quantitye + "\">" + title + "</a></div>"
                                                    + "<div class=\"product_img\"><a href=\"SpecificItem.jsp?name=" + title + "&price=" + pricee + "&producer=" + producere + "&prid=" + pride + "&rating=" + ratinge + "&description=" + desc + "&seller=" + sellere + "&img1=" + img + "&img2=" + img2e + "&img3=" + img3e + "&quantity=" + quantitye + "\"><img src=\"images/" + img + "\" width=\"165\" height=\"113\" alt=\"\" title=\"\" border=\"0\" /></a></div>"
                                                    + "<div class=\"prod_price\"><span class=\"price\">" + pricee + "$</span></div>");
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

