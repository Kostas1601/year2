
<HTML>
    <link rel="stylesheet" type="text/css" href="style.css" />
<HEAD><TITLE>Added Sucessfully!</TITLE></HEAD>
<BODY onLoad="redireccionar()">
    <SCRIPT  LANGUAGE="JavaScript">
  function redireccionar() {
    setTimeout("location.href='index.jsp'", 4000);
  }
  </SCRIPT>
<br><br><br><br>


<% out.println(" <div class=\"center_content\">");
out.println("<div class=\"oferta\">");
                 out.println("<div class=\"oferta_details\">");
                            out.println("<div class=\"oferta_title\">Your Order Has been completed successfully and will be Shipped to you As Soon As Possible</div>");
                            out.print("<div class=\"oferta_text\">"+
                            "You Will Be Redirected to the main site in a few seconds :)</div>");
                            out.println("</div>");
                            out.println("</div>");

%>
</body>
</HTML>
