<HTML>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <HEAD><TITLE>Welcome</TITLE></HEAD>
    <BODY onLoad="redireccionar()">
        <SCRIPT  LANGUAGE="JavaScript">
            function redireccionar() {
                setTimeout("location.href='index.jsp'", 4000);
            }
        </SCRIPT>
        <br><br><br><br>

        <%
                    if (session.getAttribute("theUserName") != null && session.getAttribute("thePassWD") != "") {
                        String user = session.getAttribute("theUserName").toString();
        %>

        <% out.println(" <div class=\"center_content\">");
            out.println("<div class=\"oferta\">");
            out.println("<div class=\"oferta_details\">");
            out.println("<div class=\"oferta_title\">" + "Welcome " + user + "</div>");
            out.print("<div class=\"oferta_text\">"
                    + "You Will Be Redirected to the main site in a few seconds :)</div>");
            out.println("</div>");
            out.println("</div>");
        %>
        <%
        }  else if ((session.getAttribute("usernotfound").toString()).compareTo("true") == 0) {
            out.println(" <div class=\"center_content\">");
            out.println("<div class=\"oferta\">");
            out.println("<div class=\"oferta_details\">");
            out.println("<div class=\"oferta_title\">User Not Found</div>");
            out.print("<div class=\"oferta_text\">"
                    + "The Username and/or password that you input are either <font color=\"RED\"><i>Incorrect</i> </font>or you are not signed up as a NeiLon User, Click the <font color=\"Green\"><i> Sign Up </i></font>Button to join the NeiLon Community  </div>");
            out.println("</div>");
            out.println("</div>");
        }
                    
                    session.removeAttribute("usernotfound");
                    
        %>

    </body>
</html>
