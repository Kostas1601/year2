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

                    <div class="center_title_bar">Sign Up</div>

                    <div class="prod_box_big">

                        <div class="center_prod_box_big">

                            <div class="contact_form">

                                <form method= "POST" action="InsertNewMember.jsp" id="SignUpForm">
                                    <h3><i><font color="BLUE">*Username must be at least 5 characters long </font></i><br />
                                      <i><font color="BLUE">*Password must be at least 6 characters long
                                    </font></i></h3>


                                    <div class="form_row">
                                      <label class="contact"><strong>Username:</strong></label>
                                        <input type="text" class="contact_input" name="usrname"/>
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Name:</strong></label>
                                        <input type="text" class="contact_input " name="name" />
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Last Name:</strong></label>
                                        <input type="text" class="contact_input" name="lname" />
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Email:</strong></label>
                                        <input type="text" class="contact_input" name="email" />
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Password:</strong></label>
                                        <input type="password" class="contact_input" name="passw"/>
                                    </div>


                                    <div class="form_row">
                                        <label class="contact"><strong>Phone:</strong></label>
                                        <input type="text" class="contact_input" name="phone"/>
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Country:</strong></label>
                                        <select id="country" name="selCountry">
                                            <option value="">Select a Country</option>
                                            <option value="United States">United States</option>
                                            <option value="United Kingdom">United Kingdom</option>
                                            <option value="Afghanistan">Afghanistan</option>
                                            <option value="Albania">Albania</option>
                                            <option value="Algeria">Algeria</option>
                                            <option value="American Samoa">American Samoa</option>
                                            <option value="Andorra">Andorra</option>
                                            <option value="Angola">Angola</option>
                                            <option value="Anguilla">Anguilla</option>
                                            <option value="Antarctica">Antarctica</option>
                                            <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                            <option value="Argentina">Argentina</option>
                                            <option value="Armenia">Armenia</option>
                                            <option value="Aruba">Aruba</option>
                                            <option value="Australia">Australia</option>
                                            <option value="Austria">Austria</option>
                                            <option value="Azerbaijan">Azerbaijan</option>
                                            <option value="Bahamas">Bahamas</option>
                                            <option value="Bahrain">Bahrain</option>
                                            <option value="Bangladesh">Bangladesh</option>
                                            <option value="Barbados">Barbados</option>
                                            <option value="Belarus">Belarus</option>
                                            <option value="Belgium">Belgium</option>
                                            <option value="Belize">Belize</option>
                                            <option value="Benin">Benin</option>
                                            <option value="Bermuda">Bermuda</option>
                                            <option value="Bhutan">Bhutan</option>
                                            <option value="Bolivia">Bolivia</option>
                                            <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                                            <option value="Botswana">Botswana</option>
                                            <option value="Bouvet Island">Bouvet Island</option>
                                            <option value="Brazil">Brazil</option>
                                            <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                                            <option value="Brunei Darussalam" selected="selected">Brunei Darussalam</option>
                                            <option value="Bulgaria">Bulgaria</option>
                                            <option value="Burkina Faso">Burkina Faso</option>
                                            <option value="Burundi">Burundi</option>
                                            <option value="Cambodia">Cambodia</option>
                                            <option value="Cameroon">Cameroon</option>
                                            <option value="Canada">Canada</option>
                                            <option value="Cape Verde">Cape Verde</option>
                                            <option value="Cayman Islands">Cayman Islands</option>
                                            <option value="Central African Republic">Central African Republic</option>
                                            <option value="Chad">Chad</option>
                                            <option value="Chile">Chile</option>
                                            <option value="China">China</option>
                                            <option value="Christmas Island">Christmas Island</option>
                                            <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                                            <option value="Colombia">Colombia</option>
                                            <option value="Comoros">Comoros</option>
                                            <option value="Congo">Congo</option>
                                            <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                                            <option value="Cook Islands">Cook Islands</option>
                                            <option value="Costa Rica">Costa Rica</option>
                                            <option value="Cote D'ivoire">Cote D'ivoire</option>
                                            <option value="Croatia">Croatia</option>
                                            <option value="Cuba">Cuba</option>
                                            <option value="Cyprus">Cyprus</option>
                                            <option value="Czech Republic">Czech Republic</option>
                                            <option value="Denmark">Denmark</option>
                                            <option value="Djibouti">Djibouti</option>
                                            <option value="Dominica">Dominica</option>
                                            <option value="Dominican Republic">Dominican Republic</option>
                                            <option value="Ecuador">Ecuador</option>
                                            <option value="Egypt">Egypt</option>
                                            <option value="El Salvador">El Salvador</option>
                                            <option value="Equatorial Guinea">Equatorial Guinea</option>
                                            <option value="Eritrea">Eritrea</option>
                                            <option value="Estonia">Estonia</option>
                                            <option value="Ethiopia">Ethiopia</option>
                                            <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                                            <option value="Faroe Islands">Faroe Islands</option>
                                            <option value="Fiji">Fiji</option>
                                            <option value="Finland">Finland</option>
                                            <option value="France">France</option>
                                            <option value="French Guiana">French Guiana</option>
                                            <option value="French Polynesia">French Polynesia</option>
                                            <option value="French Southern Territories">French Southern Territories</option>
                                            <option value="Gabon">Gabon</option>
                                            <option value="Gambia">Gambia</option>
                                            <option value="Georgia">Georgia</option>
                                            <option value="Germany">Germany</option>
                                            <option value="Ghana">Ghana</option>
                                            <option value="Gibraltar">Gibraltar</option>
                                            <option value="Greece">Greece</option>
                                            <option value="Greenland">Greenland</option>
                                            <option value="Grenada">Grenada</option>
                                            <option value="Guadeloupe">Guadeloupe</option>
                                            <option value="Guam">Guam</option>
                                            <option value="Guatemala">Guatemala</option>
                                            <option value="Guinea">Guinea</option>
                                            <option value="Guinea-bissau">Guinea-bissau</option>
                                            <option value="Guyana">Guyana</option>
                                            <option value="Haiti">Haiti</option>
                                            <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                                            <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                                            <option value="Honduras">Honduras</option>
                                            <option value="Hong Kong">Hong Kong</option>
                                            <option value="Hungary">Hungary</option>
                                            <option value="Iceland">Iceland</option>
                                            <option value="India">India</option>
                                            <option value="Indonesia">Indonesia</option>
                                            <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                                            <option value="Iraq">Iraq</option>
                                            <option value="Ireland">Ireland</option>
                                            <option value="Israel">Israel</option>
                                            <option value="Italy">Italy</option>
                                            <option value="Jamaica">Jamaica</option>
                                            <option value="Japan">Japan</option>
                                            <option value="Jordan">Jordan</option>
                                            <option value="Kazakhstan">Kazakhstan</option>
                                            <option value="Kenya">Kenya</option>
                                            <option value="Kiribati">Kiribati</option>
                                            <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                                            <option value="Korea, Republic of">Korea, Republic of</option>
                                            <option value="Kuwait">Kuwait</option>
                                            <option value="Kyrgyzstan">Kyrgyzstan</option>
                                            <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                                            <option value="Latvia">Latvia</option>
                                            <option value="Lebanon">Lebanon</option>
                                            <option value="Lesotho">Lesotho</option>
                                            <option value="Liberia">Liberia</option>
                                            <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
                                            <option value="Liechtenstein">Liechtenstein</option>
                                            <option value="Lithuania">Lithuania</option>
                                            <option value="Luxembourg">Luxembourg</option>
                                            <option value="Macao">Macao</option>
                                            <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                                            <option value="Madagascar">Madagascar</option>
                                            <option value="Malawi">Malawi</option>
                                            <option value="Malaysia">Malaysia</option>
                                            <option value="Maldives">Maldives</option>
                                            <option value="Mali">Mali</option>
                                            <option value="Malta">Malta</option>
                                            <option value="Marshall Islands">Marshall Islands</option>
                                            <option value="Martinique">Martinique</option>
                                            <option value="Mauritania">Mauritania</option>
                                            <option value="Mauritius">Mauritius</option>
                                            <option value="Mayotte">Mayotte</option>
                                            <option value="Mexico">Mexico</option>
                                            <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                                            <option value="Moldova, Republic of">Moldova, Republic of</option>
                                            <option value="Monaco">Monaco</option>
                                            <option value="Mongolia">Mongolia</option>
                                            <option value="Montserrat">Montserrat</option>
                                            <option value="Morocco">Morocco</option>
                                            <option value="Mozambique">Mozambique</option>
                                            <option value="Myanmar">Myanmar</option>
                                            <option value="Namibia">Namibia</option>
                                            <option value="Nauru">Nauru</option>
                                            <option value="Nepal">Nepal</option>
                                            <option value="Netherlands">Netherlands</option>
                                            <option value="Netherlands Antilles">Netherlands Antilles</option>
                                            <option value="New Caledonia">New Caledonia</option>
                                            <option value="New Zealand">New Zealand</option>
                                            <option value="Nicaragua">Nicaragua</option>
                                            <option value="Niger">Niger</option>
                                            <option value="Nigeria">Nigeria</option>
                                            <option value="Niue">Niue</option>
                                            <option value="Norfolk Island">Norfolk Island</option>
                                            <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                                            <option value="Norway">Norway</option>
                                            <option value="Oman">Oman</option>
                                            <option value="Pakistan">Pakistan</option>
                                            <option value="Palau">Palau</option>
                                            <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                                            <option value="Panama">Panama</option>
                                            <option value="Papua New Guinea">Papua New Guinea</option>
                                            <option value="Paraguay">Paraguay</option>
                                            <option value="Peru">Peru</option>
                                            <option value="Philippines">Philippines</option>
                                            <option value="Pitcairn">Pitcairn</option>
                                            <option value="Poland">Poland</option>
                                            <option value="Portugal">Portugal</option>
                                            <option value="Puerto Rico">Puerto Rico</option>
                                            <option value="Qatar">Qatar</option>
                                            <option value="Reunion">Reunion</option>
                                            <option value="Romania">Romania</option>
                                            <option value="Russian Federation">Russian Federation</option>
                                            <option value="Rwanda">Rwanda</option>
                                            <option value="Saint Helena">Saint Helena</option>
                                            <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                                            <option value="Saint Lucia">Saint Lucia</option>
                                            <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                                            <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                                            <option value="Samoa">Samoa</option>
                                            <option value="San Marino">San Marino</option>
                                            <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                                            <option value="Saudi Arabia">Saudi Arabia</option>
                                            <option value="Senegal">Senegal</option>
                                            <option value="Serbia and Montenegro">Serbia and Montenegro</option>
                                            <option value="Seychelles">Seychelles</option>
                                            <option value="Sierra Leone">Sierra Leone</option>
                                            <option value="Singapore">Singapore</option>
                                            <option value="Slovakia">Slovakia</option>
                                            <option value="Slovenia">Slovenia</option>
                                            <option value="Solomon Islands">Solomon Islands</option>
                                            <option value="Somalia">Somalia</option>
                                            <option value="South Africa">South Africa</option>
                                            <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                                            <option value="Spain">Spain</option>
                                            <option value="Sri Lanka">Sri Lanka</option>
                                            <option value="Sudan">Sudan</option>
                                            <option value="Suriname">Suriname</option>
                                            <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                                            <option value="Swaziland">Swaziland</option>
                                            <option value="Sweden">Sweden</option>
                                            <option value="Switzerland">Switzerland</option>
                                            <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                                            <option value="Taiwan, Province of China">Taiwan, Province of China</option>
                                            <option value="Tajikistan">Tajikistan</option>
                                            <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                                            <option value="Thailand">Thailand</option>
                                            <option value="Timor-leste">Timor-leste</option>
                                            <option value="Togo">Togo</option>
                                            <option value="Tokelau">Tokelau</option>
                                            <option value="Tonga">Tonga</option>
                                            <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                            <option value="Tunisia">Tunisia</option>
                                            <option value="Turkey">Turkey</option>
                                            <option value="Turkmenistan">Turkmenistan</option>
                                            <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                                            <option value="Tuvalu">Tuvalu</option>
                                            <option value="Uganda">Uganda</option>
                                            <option value="Ukraine">Ukraine</option>
                                            <option value="United Arab Emirates">United Arab Emirates</option>
                                            <option value="United Kingdom">United Kingdom</option>
                                            <option value="United States">United States</option>
                                            <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                                            <option value="Uruguay">Uruguay</option>
                                            <option value="Uzbekistan">Uzbekistan</option>
                                            <option value="Vanuatu">Vanuatu</option>
                                            <option value="Venezuela">Venezuela</option>
                                            <option value="Viet Nam">Viet Nam</option>
                                            <option value="Virgin Islands, British">Virgin Islands, British</option>
                                            <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                                            <option value="Wallis and Futuna">Wallis and Futuna</option>
                                            <option value="Western Sahara">Western Sahara</option>
                                            <option value="Yemen">Yemen</option>
                                            <option value="Zambia">Zambia</option>
                                            <option value="Zimbabwe">Zimbabwe</option>
                                        </select>
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Zip Code:</strong></label>
                                        <input type="text" class="contact_input" name="zip"/>
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Street:</strong></label>
                                        <input type="text" class="contact_input" name="street"/>
                                    </div>
                                    <div class="form_row">
                                        <label class="contact"><strong>Number:</strong></label>
                                        <input type="text" class="contact_input" name="numb"/>
                                    </div>
                                    <div class="form_row">
                                        <label class="contact"><strong>City:</strong></label>
                                        <input type="text" class="contact_input" name="city"/>
                                    </div>

                                    <div class="form_row">
                                        <label class="contact"><strong>Birthday:</strong></label>
                                        <select id="birthyear" name="birthyear">
                                            <option value="2011">2011</option>
                                            <option value="2010">2010</option>
                                            <option value="2009">2009</option>
                                            <option value="2008">2008</option>
                                            <option value="2007">2007</option>
                                            <option value="2006">2006</option>
                                            <option value="2005">2005</option>
                                            <option value="2004">2004</option>
                                            <option value="2003">2003</option>
                                            <option value="2002">2002</option>
                                            <option value="2001">2001</option>
                                            <option value="2000">2000</option>
                                            <option value="1999">1999</option>
                                            <option value="1998">1998</option>
                                            <option value="1997">1997</option>
                                            <option value="1996">1996</option>
                                            <option value="1995">1995</option>
                                            <option value="1994">1994</option>
                                            <option value="1993">1993</option>
                                            <option value="1992">1992</option>
                                            <option value="1991">1991</option>
                                            <option value="1990">1990</option>
                                            <option value="1989">1989</option>
                                            <option value="1988">1988</option>
                                            <option value="1987">1987</option>
                                            <option value="1986">1986</option>
                                            <option value="1985">1985</option>
                                            <option value="1984">1984</option>
                                            <option value="1983">1983</option>
                                            <option value="1982">1982</option>
                                            <option value="1981">1981</option>
                                            <option value="1980">1980</option>
                                            <option value="1979">1979</option>
                                            <option value="1978">1978</option>
                                            <option value="1977">1977</option>
                                            <option value="1976">1976</option>
                                            <option value="1975">1975</option>
                                            <option value="1974">1974</option>
                                            <option value="1973">1973</option>
                                            <option value="1972">1972</option>
                                            <option value="1971">1971</option>
                                            <option value="1970">1970</option>
                                            <option value="1969">1969</option>
                                            <option value="1968">1968</option>
                                            <option value="1967">1967</option>
                                            <option value="1966">1966</option>
                                            <option value="1965">1965</option>
                                            <option value="1964">1964</option>
                                            <option value="1963">1963</option>
                                            <option value="1962">1962</option>
                                            <option value="1961">1961</option>
                                            <option value="1960">1960</option>
                                            <option value="1959">1959</option>
                                            <option value="1958">1958</option>
                                            <option value="1957">1957</option>
                                            <option value="1956">1956</option>
                                            <option value="1955">1955</option>
                                            <option value="1954">1954</option>
                                            <option value="1953">1953</option>
                                            <option value="1952">1952</option>
                                            <option value="1951">1951</option>
                                            <option value="1950">1950</option>
                                            <option value="1949">1949</option>
                                            <option value="1948">1948</option>
                                            <option value="1947">1947</option>
                                            <option value="1946">1946</option>
                                            <option value="1945">1945</option>
                                            <option value="1944">1944</option>
                                            <option value="1943">1943</option>
                                            <option value="1942">1942</option>
                                            <option value="1941">1941</option>
                                            <option value="1940">1940</option>
                                            <option value="1939">1939</option>
                                            <option value="1938">1938</option>
                                            <option value="1937">1937</option>
                                            <option value="1936">1936</option>
                                            <option value="1935">1935</option>
                                            <option value="1934">1934</option>
                                            <option value="1933">1933</option>
                                            <option value="1932">1932</option>
                                            <option value="1931">1931</option>
                                            <option value="1930">1930</option>
                                            <option value="1929">1929</option>
                                            <option value="1928">1928</option>
                                            <option value="1927">1927</option>
                                            <option value="1926">1926</option>
                                            <option value="1925">1925</option>
                                            <option value="1924">1924</option>
                                            <option value="1923">1923</option>
                                            <option value="1922">1922</option>
                                            <option value="1921">1921</option>
                                            <option value="1920">1920</option>
                                            <option value="1919">1919</option>
                                            <option value="1918">1918</option>
                                            <option value="1917">1917</option>
                                            <option value="1916">1916</option>
                                            <option value="1915">1915</option>
                                            <option value="1914">1914</option>
                                            <option value="1913">1913</option>
                                            <option value="1912">1912</option>
                                            <option value="1911">1911</option>
                                            <option value="1910">1910</option>
                                            <option value="1909">1909</option>
                                            <option value="1908">1908</option>
                                            <option value="1907">1907</option>
                                            <option value="1906">1906</option>
                                            <option value="1905">1905</option>
                                            <option value="1904">1904</option>
                                            <option value="1903">1903</option>
                                            <option value="1902">1902</option>
                                            <option value="1901">1901</option>
                                            <option value="1900">1900</option>
                                        </select>
                                        <select id="birthmonth" name="birthmonth">
                                            <option value="1">Jan</option>
                                            <option value="2">Feb</option>
                                            <option value="3">Mar</option>
                                            <option value="4">Apr</option>
                                            <option value="5">May</option>
                                            <option value="6">Jun</option>
                                            <option value="7">Jul</option>
                                            <option value="8">Aug</option>
                                            <option value="9">Sep</option>
                                            <option value="10">Oct</option>
                                            <option value="11">Nov</option>
                                            <option value="12">Dec</option>
                                        </select>
                                        <select id="birthday" name="birthday">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">27</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                            <option value="31">31</option>
                                        </select>
                                    </div>


                                    <input type="submit" value="signup">
                                    <% if (session.getAttribute("Error") == "error") {
                                                    out.println("<h3><font color=\"RED\"><i>Please Complete All Required fields correctly</i></font></h3>");
                                                }
                                                session.removeAttribute("Error");

                                    %>
                                </form>

                            </div>


                        </div>

                    </div>





                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
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

