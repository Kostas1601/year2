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




   	<div class="center_title_bar">Terms Of Use</div>

    	<div class="prod_box_big">
    	  <p>Below are the general rules for the normal functionality of the website</p>
    	  <p>Rules<br />
    	    To promote a safe trading environment for all members, Neilon has rules and policies that are enforced. Neilon's policies are intended to:</p>
    	  <p> * Support government laws and regulations<br />
    	    * Minimize risks to both buyers and sellers<br />
    	    * Provide equal opportunity to all buyers and sellers<br />
    	    * Protect intellectual property rights<br />
    	    * Provide an enjoyable buying experience  	    </p>
    	  <p>When policy violations occur, Neilon emails the seller, as well as bidders, that a listing has been ended. Learning about Neilon's selling policies before you list an item will help you to avoid unintentionally breaking rules (including the law).</p>
    	  <p>Reporting violations - You can report what you believe to be a violation by contacting us from the &quot;Contact Us&quot; page on the upper  side of any page. To learn about the type of offenses that Neilon investigates, see Reporting Inappropriate Trading Behavior.</p>
    	  <p>Rules about Feedback - your Neilon reputation<br />
    	    Neilon members can write a review about a product they have bought  or leave feedback about the consistency of the product's seller. Neilon has created policies to guard against feedback manipulation and feedback abuse. If a user writes a review about a product without actually being a member of the website, then a warning email will be sent to the user and his review will be immediately removed.</p>
    	  <p>Rules for everyone<br />
    	    Neilon wants to ensure that everyone who participates in the Neilon Community has a safe and enjoyable experience. These rules apply to buyers, sellers and even Neilon employees. Learn more about issues like the use of profanity, unsolicited email (spam),by contacting us in the appropriate section(see above).</p>
    	  <p>Rules for buying<br />
    	    Buyer rules assist buyers in doing the right thing in a transaction. Learning about these rules will make your Neilon experience a safe and enjoyable one.</p>
    	  <p>Rules for selling<br />
    	    If you are listing an item for sale, it is always a good idea to check Neilon's listing policies to ensure that your listing is permitted on our website. If your item sells successfully, the sale needs to be completed. This includes contacting your buyer, accepting payment and shipping the item. Learn about what is considered seller non-performance and why bidding on your items by certain members is considered shill bidding and is prohibited.</p>
    	  <p> * Prohibited and Restricted Items<br />
    	    Are you sure your item is allowed on Neilon? You can learn more about prohibited and restricted items here. These items include alcohol, animals, credit cards, food, fireworks, tobacco and weapons.<br />
  	    </p>
    	  <p> * Rules for Listings<br />
    	    Neilon has restrictions about the contents of item listings, how certain types of items are described, and prohibitions against practices that would provide an unfair advantage or result in a negative buyer experience. These policies cover listing issues like including links, payment surcharges and keyword spamming.</p>
    	  <p>&nbsp;</p>
    	  <h4>As a seller, you have to:</h4>
    	  <h4>	Charge reasonable shipping costs.</h4>
    	  <h4>Follow through on your return policy.</h4>
    	  <h4>Respond to buyers' questions promptly.</h4>
    	  <h4>Be helpful, friendly and professional throughout a transaction.</h4>
    	  <p> * Rules about Intellectual Property<br />
    	    Are you sure your item doesn't infringe a third party's intellectual property rights? It is not always obvious. For example, listing an empty branded box could encourage intellectual property infringement. Do you suspect that someone's item is counterfeit? Items that bear a company's official brand name or logo can be listed as long as the products were made or officially endorsed by that company.</p>
    	  <p>To ensure the best buying/selling experience for all members, we don't allow listings for counterfeit items, fakes, replicas, or unauthorized copies. Unauthorizes copies include things that are backed-up, bootlegged, duplicated or pirated</p>
    	  <p>&nbsp;</p>
    	  <p>If you don't respect the rules of the website,upload an illegal item or try to hack the website in one way or another, a warning email will be sent to you and will raise your warning rating depending on your actions. If your warning rating is high enough, then you will be banned from the Neilon Community forever, you will not be allowed to buy or sell any items or participate in any way in the Neilon Community.</p>
    	  <p>&nbsp;</p>
    	  <p>Regards, the Neilon Administrators</p>
    	</div>


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
                                            out.println("<div class=\"product_title\"><a href=\"SpecificItem.jsp?name=" + title + "&price=" + price + "&producer=" + producer+ "&prid=" + prid + "&rating=" + rating + "&description=" + desc + "&seller=" + seller + "&img1=" + img + "&img2=" + img2 + "&img3=" + img3 + "&quantity=" + quantity + "\">" + title + "</a></div>"
                                                    + "<div class=\"product_img\"><a href=\"SpecificItem.jsp?name=" + title + "&price=" + price + "&producer=" + producer+ "&prid=" + prid + "&rating=" + rating + "&description=" + desc + "&seller=" + seller + "&img1=" + img + "&img2=" + img2 + "&img3=" + img3 + "&quantity=" + quantity + "\"><img src=\"images/" + img + "\" width=\"165\" height=\"113\" alt=\"\" title=\"\" border=\"0\" /></a></div>"
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

