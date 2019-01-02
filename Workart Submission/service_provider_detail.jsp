
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/lightbox.css" rel="stylesheet" type="text/css"/>

        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/lightbox.min.js" type="text/javascript"></script>
        <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDe1vt5A7_wcqk7mU9eCSJtQN_VFsb_ic8&sensor=false"></script>
        <title>JSP Page</title>
        <script>
            var xmlhttp = new XMLHttpRequest();
            var sp_email;
            function book()
            {


                xmlhttp.open("GET", "check_booking.jsp", true);
                xmlhttp.onreadystatechange = go10;
                xmlhttp.send();

            }
            function go10()
            {
                sp_email = document.getElementById("sp_email").value;
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var status = xmlhttp.responseText.trim();
                    if (status == "success")
                    {
                        $("#mymodal").modal("show");

                    } else if (status == "fail")
                    {
                        window.location.href = "book_service_provider.jsp?sp_email=" + sp_email;

                    }
                }
            }

            function login()
            {

                sp_email = document.getElementById("sp_email").value;
                var email = document.getElementById("email").value;
                var password = document.getElementById("pass").value;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.open("GET", "login_check2.jsp?email=" + email + "&password=" + password, true);
                xmlhttp.onreadystatechange = go11;
                xmlhttp.send();

            }
            function go11()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var status1 = xmlhttp.responseText.trim();
                    if (status1 == "correct")
                    {
                        window.location.href = "book_service_provider.jsp?sp_email=" + sp_email;

                    } else if (status1 == "incorrect")
                    {
                        alert("Incorrect email/password");

                    }
                }
            }

            function go()
            {


                fetch_review();
                var lat1 = document.getElementById("latitude").value;
                var lng1 = document.getElementById("longitude").value;
             
                var mapProp = {
                    center: new google.maps.LatLng(lat1, lng1),
                    zoom: 9,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                };

                var map = new google.maps.Map(document.getElementById("maps1"), mapProp);

                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat1, lng1)
                });

                marker.setMap(map);
            }



            function rating()
            {
                xmlhttp.open("GET", "check_booking.jsp", true);
                xmlhttp.onreadystatechange = go13;
                xmlhttp.send();

            }
            function go13()
            {
                sp_email = document.getElementById("sp_email").value;
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var status = xmlhttp.responseText.trim();
                    if (status == "success")
                    {
                        $("#mymodallogin").modal("show");

                    } else if (status == "fail")
                    {
                        $("#mymodalrating").modal("show");

                    }
                }
            }
            function loginrating()
            {

                sp_email = document.getElementById("sp_email").value;
                var email = document.getElementById("email1").value;
                var password = document.getElementById("pass1").value;
                xmlhttp.open("GET", "login_check2.jsp?email=" + email + "&password=" + password, true);
                xmlhttp.onreadystatechange = go14;
                xmlhttp.send();

            }
            function go14()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var status1 = xmlhttp.responseText.trim();
                    if (status1 == "correct")
                    {
                        $("#mymodallogin").modal("hide");
                        $("#mymodalrating").modal("show");

                    } else if (status1 == "incorrect")
                    {
                        alert("Incorrect email/password");

                    }
                }
            }
            var n = 0;
            function fill(obj)
            {
                var img = obj.src;
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                var i;
                if (n == 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    if (i <= val)
                    {
                        document.getElementById("rating_" + i).src = "./filled_star.png";

                    } else
                    {
                        document.getElementById("rating_" + i).src = "./empty_star.png";
                    }
                }

            }
            function selected(obj)
            {
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                n = val;
                alert(n);

            }
            function unfill(obj)
            {
                var i;
                if (n == 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    document.getElementById("rating_" + i).src = "./empty_star.png";
                }
            }
            function go66()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    $("#mymodalrating").modal("hide");
                    
                    fetch_review();

                }

            }

            function setrating()

            {
                var sp_email = document.getElementById("sp_email").value;
                var ta = document.getElementById("ta").value;
                xmlhttp.open("GET", "setrating.jsp?n=" + n + "&ta=" + ta + "&sp_email=" + sp_email, true);
                xmlhttp.onreadystatechange = go66;
                xmlhttp.send();

            }
            function go67()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("newrating").innerHTML = xmlhttp.responseText;


                }

            }

            function fetch_review()

            {
                var myParam = location.search.split('sp_email=')[1];
                var sp_email = myParam.toString();
                
                xmlhttp.open("GET", "fetch_review.jsp?sp_email=" + sp_email, false);
                xmlhttp.onreadystatechange = go67;
                xmlhttp.send();
                
            }






        </script>
    </head>
    <body onload="go()"  style="background-color:#f5f5f5">

        <%
                if (session.getAttribute("user_email") == null) 
                {
        %>
                  <%@include file="public_header.jsp"%>
        <%
                } 
                else 
                {
        %>
                   <%@include file="user_header.jsp"%>
        <%      }
        %>
        
        <div class="container-fluid">

            <%String sp_email = request.getParameter("sp_email");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from service_provider where sp_email=\'" + sp_email + "\'");
                if (rs.next()) {
                    String sub_category = rs.getString("sub_category");
                    String photo_sp = rs.getString("photo");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String website = rs.getString("website");
                    String per_hour_price = rs.getString("per_hour_price");
                    int starting_hour = Integer.parseInt(rs.getString("starting_hour"));
                    int ending_hour = Integer.parseInt(rs.getString("ending_hour"));
                    String description = rs.getString("description");
                    String city = rs.getString("city");
                    String latitude = rs.getString("latitude");
                    String longitude = rs.getString("longitude");

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs1 = stmt1.executeQuery("select * from sub_categories where sub_category_name=\'" + sub_category + "\'");
                    if (rs1.next()) {
                        String photo = rs1.getString("photo");

            %>
            <input type="hidden" id="sp_email" value="<%=sp_email%>"/>
            <input type="hidden" id="latitude" value="<%=latitude%>"/>
            <input type="hidden" id="longitude" value="<%=longitude%>"/>

            <div class="row">
                <div style="border:solid 1px black">    

                    <img src="<%= photo%>" style="width: 100%; height: 300px;" />

                </div>


            </div>
            

            <div class="row" style="padding: 0px">
                <div class="col-sm-10 col-sm-offset-1" style="background-color:white;margin-top: 10px;border: solid 2px black; padding: 0px">
                    <div  data-toggle="collapse" data-target="#basic" style="background: #3e3d3d;color:white;font-size:20px; padding: 10px">Basic Details <span class="glyphicon glyphicon-plus" style="float: right"></span></div>

                    <div class="collapse in" id="basic">

                        <div class="row" style="padding: 10px">

                            <div class="col-sm-3">
                                <img src="<%=photo_sp%>" style="width:150px;height:150px"/>
                            </div>
                            <div class="col-sm-9">
                                <label><%=name%></label>
                                <br>




                                <% Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                                    Statement stmt4 = conn4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                    ResultSet rs4 = stmt4.executeQuery("select avg(num) as average from rating where sp_email=\'" + sp_email + "\'");
                                    if (rs4.next()) {
                                        float f = rs4.getFloat("average");
                                        int a = (int) (f);

                                        for (int i = 1; i <= a; i++) {
                                %>

                                <img src="./filled_star.png"  height="25" width="25">
                                <%
                                    }
                                    if ((f - a) == 0) {
                                        for (int i = 1; i <= 5 - a; i++) {
                                %>
                                <img src="./empty_star.png"  height="25" width="25">
                                <%
                                    }
                                } else {
                                %>

                                <img src="./halffilled_star.png"  height="25" width="25">
                                <%for (int i = 1; i <= 3 - a; i++) {
                                %>
                                <img src="./empty_star.png"  height="25" width="25">
                                <%   }

                                        }
                                    }
                                %>

                                <br><br>
                                <input type="button" class="btn btn-success" value="Book"  onclick="book()" style="background: #3e3d3d;color:white;margin-right:30px"/>
                            </div>
                        </div>




                        <form class="form-horizontal" style="padding-left:25px">
                            <div class="form-group" >
                                <div class="glyphicon glyphicon-envelope" style="color:#cc0033"></div>
                                <label> <%=sp_email%></label></div>
                            <div class="form-group">
                                <div class="glyphicon glyphicon-phone" style="color: #000000 "></div>
                                <%=phone%></div>
                            <div class="form-group">
                                <div class="glyphicon glyphicon-log-in" style="color:#1b6d85"></div>
                                <%=website%></div>
                            <div class="form-group">
                                <div class="glyphicon glyphicon-usd" style="color: #cc0066"></div>
                                <label><%=per_hour_price%></label></div>
                            <div class="form-group">
                                <div class="glyphicon glyphicon-time" style="color: #00cccc"></div>
                                <%
                                    if (starting_hour <= 12) {
                                %>
                                <label><%=starting_hour%>am(starting hr)</label>

                                <% } else {
                                    starting_hour = starting_hour - 12;


                                %>
                                <label><%=starting_hour%>pm(starting hr)</label>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <div class="glyphicon glyphicon-time" style="color: #660000"></div>
                                <%
                                    if (ending_hour <= 12) {
                                %>
                                <label><%=ending_hour%>am(ending hr)</label> 

                                <% } else {
                                    ending_hour = ending_hour - 12;


                                %>
                                <label><%=ending_hour%>pm(ending hr)</label>
                                <%}%></div>

                            <div class="form-group">
                                <label style="color: #330066"> <%=description%></label></div>
                            <div class="form-group">
                                <div class="glyphicon glyphicon-map-marker" style="color: #ff9900"></div>
                                <label> <%=city%></label></div>




                        </form>
                    </div>

                </div>
            </div>





            <%
                    }
                }
            %>

            <div class="row" style="margin-top: 20px;padding:0px">
                <div class="col-sm-10 col-sm-offset-1" style="background-color:white;margin-top: 10px;border: solid 2px black; padding: 0px">
                    <div  data-toggle="collapse" data-target="#basic1" style="background: #3e3d3d;color: white; padding: 10px;font-size:20px;">View Gallery<span class="glyphicon glyphicon-plus" style="float: right"></span></div>

                    <div class="collapse in" id="basic1">

                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs2 = stmt2.executeQuery("select * from work_gallery where sp_email=\'" + sp_email + "\'");
                            while (rs2.next()) {
                                String photo2 = rs2.getString("photo");
                        %>
                        <input type="hidden" value="<%=sp_email%>" id="sp"/>

                        <div class="col-sm-4" style="margin-bottom: 10px;margin-top: 10px">
                            <a href="<%=photo2%>"  data-lightbox="image-1" title="image1"> <img src="<%=photo2%>"  style="height:150px;width:150px;border:solid 1px black"/><br></a>

                        </div> 



                        <%}
                        %>
                    </div>
                </div>
            </div>
            <div class="row" style="padding: 0px">
                <div class="col-sm-10 col-sm-offset-1" style="background-color:white;margin-top: 20px;border: solid 2px black; padding: 0px">
                    <div  data-toggle="collapse" data-target="#basicmap" style="background: #3e3d3d;color: white;font-size:20px; padding: 10px">Locate us on <span class="glyphicon glyphicon-plus" style="float: right"></span></div>

                    <div class="collapse in" id="basicmap">
                        <div id="maps1" style="height: 400px">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="padding: 0px">
                <div class="col-sm-10 col-sm-offset-1" style="background-color:white;margin-top: 20px;border: solid 2px black; padding: 0px">
                    <div  data-toggle="collapse" data-target="#basicmap1" style="background: #3e3d3d;color:white;font-size:20px; padding: 10px">User Rating <span class="glyphicon glyphicon-plus" style="float: right"></span></div>

                    <div class="collapse in" id="basicmap1">
                        <br><br>
                        <input type="button" class="btn btn-success"   value="Add New Ratings" style="margin-left:900px;background: #3e3d3d;color:white" onclick="rating()"/>
                        <br>
                        <br>
                        <div id="newrating" style="padding: 10px">
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </div>
    <!-- Modal -->
    <div id="mymodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" style="background-color: white">

                <div class="modal-header">
                    <center><label>Login</label></center>
                </div>
                <div class="modal-body">

                    <div class="form-group" >
                        <label class="col-sm-2">Email</label>
                        <div class="col-sm-10" ><input type="text" class="form-control"  id="email" required="" />
                            <br></div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2">Password</label>
                        <div class="col-sm-10"><input type="password" id="pass" class="form-control"/></div>
                    </div>


                    <center>  <input type="button" value="Login"  style="margin-top: 10px;background: #3e3d3d;color:white" class="btn btn-success" onclick="login()"/></center>




                </div>
                <div class="modal-footer">
                    <button type="button" class="close" data-dismiss="modal">Close</button>

                </div>

            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="mymodalrating" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" style="background-color: white">

                <div class="modal-header">
                    <center><label>Reviews</label></center>
                </div>
                <div class="modal-body">

                    <div id="main" style="min-height:70px" > 
                        <center> 
                            <img id="rating_1" src="./empty_star.png"  height="40" width="40" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)"></td>
                            <td> <img id="rating_2" src="./empty_star.png"  height="40" width="40" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)"></td> 
                            <td> <img id="rating_3" src="./empty_star.png" height="40" width="40" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)"></td>
                            <td><img id="rating_4" src="./empty_star.png"  height="40" width="40" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)"></td>
                            <td> <img id="rating_5" src="./empty_star.png" height="40" width="40" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                        </center></div>
                    <div class="form-group">
                        <label class="col-sm-2">Enter Rating</label>
                        <div class="col-sm-10"><textarea name="ta" id="ta" class="col-sm-12"></textarea></div>
                    </div>
                    <center>  <input type="button" value="Add"  style="margin-top: 10px;background: #3e3d3d;color:white" class="btn btn-success" onclick="setrating()"/></center>


                </div>
                <div class="modal-footer">
                    <button type="button" class="close" data-dismiss="modal">Close</button>

                </div>

            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="mymodallogin" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" style="background-color: white">

                <div class="modal-header">
                    <center><label>Login</label></center>
                </div>
                <div class="modal-body">

                    <div class="form-group" >
                        <label class="col-sm-2">Enter email</label>
                        <div class="col-sm-10" ><input type="text" class="form-control"  id="email1" required="" />
                            <br></div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2">Enter password</label>
                        <div class="col-sm-10"><input type="password" id="pass1" class="form-control"/></div>
                    </div>


                    <center>  <input type="button" value="Login"  style="margin-top: 10px;background: #3e3d3d;color:white" class="btn btn-default btn-info" onclick="loginrating()"/></center>




                </div>
                <div class="modal-footer">
                    <button type="button" class="close" data-dismiss="modal">Close</button>

                </div>

            </div>
        </div>
    </div>



    <%@include file="footer.jsp"%>
</body>


</html>


<%------------------------------------------------- the code under this comment is not oroiginal ------------------------%>



<%-- 
    Document   : service_provider_detail
    Created on : 21 Apr, 2017, 4:51:57 PM
    Author     : SONY
--%>
<%--
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" type="image/x-icon" href="" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/lightbox.min.js" type="text/javascript"></script>
        <link href="css/lightbox.css" rel="stylesheet" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="one.css">
        <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAm5nmVH_9OBmSk8vvJAEuM5-2_XvfRafY" async></script>
        <script type="text/javascript">
            function go1()
            {
                 fetch_reviews();
                var lat1 = document.getElementById("lat1").value;
                var lng1 = document.getElementById("lng1").value;
                alert(lat1 + ' ' + lng1);
                var mapProp = {
                    center: new google.maps.LatLng(lat1, lng1),
                    zoom: 9,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                };

                var map = new google.maps.Map(document.getElementById("maps1"), mapProp);

                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat1, lng1)
                });

                marker.setMap(map);
            }
            var email = "";
            var xmlhttp;
            function check()
            {
                email = document.getElementById("sp_email").value;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go6;
                xmlhttp.open("GET", "check_login.jsp", true);
                xmlhttp.send();

            }
            function go6()
            {

                
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var res = xmlhttp.responseText.trim();

                    if (res == "Logged in")
                    {
                        window.location.href = "booking.jsp?sp_email=" + email;
                    } else
                    {

                        $("#myModal").modal('show');
                    }

                }
            }

            var em = "";
            var ps = "";

            function login()
            {
                email = document.getElementById("sp_email").value;
                em = document.getElementById("em").value;
                ps = document.getElementById("ps").value;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "check_login2.jsp?em=" + em + "&ps=" + ps, true);
                xmlhttp.send();

            }
            function go2()
            {


                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var res = xmlhttp.responseText.trim();

                    if (res == "correct")
                    {
                        alert("LOGIN SUCCESSFULL");
                        window.location.href = "booking.jsp?sp_email=" + email;
                    } else
                    {

                        alert("Not correct");
                    }

                }
            }




            function rate()
            {

                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go11;
                xmlhttp.open("GET", "check_login.jsp", true);
                xmlhttp.send();

            }
            function go11()
            {


                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var res = xmlhttp.responseText.trim();
                    if (res == "Logged in")
                    {
                        $("#RatingModal").modal('show');
                    } else
                    {

                        $("#LoginModal").modal('show');
                    }

                }
            }



            function userlogin()
            {

                em = document.getElementById("em1").value;
                ps = document.getElementById("ps1").value;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go20;
                xmlhttp.open("GET", "check_login2.jsp?em=" + em + "&ps=" + ps, true);
                xmlhttp.send();

            }
            function go20()
            {


                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {

                    var res = xmlhttp.responseText.trim();

                    if (res == "correct")
                    {
                        alert("LOGIN SUCCESSFULL");
                        $("#RatingModal").modal('show');
                        $("#LoginModal").modal('hide');

                    } else
                    {

                        alert("Not correct");
                    }

                }
            }




            var n = 0;
            function fill(obj)
            {
                var img = obj.src;
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                var i;
                if (n == 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    if (i <= val)
                    {
                        document.getElementById("rating_" + i).src = "./filled_star.png";

                    } else
                    {
                        document.getElementById("rating_" + i).src = "./empty_star.png";
                    }
                }

            }
            function selected(obj)
            {
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                n = val;

            }
            function unfill(obj)
            {
                var i;
                if (n == 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    document.getElementById("rating_" + i).src = "./empty_star.png";
                }
            }

            function setRating()
            {
                var email = document.getElementById("sp_email").value;
                var reviews = document.getElementById("ta").value;

                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go12;
                xmlhttp.open("GET", "set_rating.jsp?rating=" + n + "&reviews=" + reviews + "&sp_email=" + email, true);
                xmlhttp.send();

            }
            function go12()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var rate = xmlhttp.responseText.trim();
                    $("#RatingModal").modal('hide');
                    fetch_reviews();
                }

            }
            function fetch_reviews()
            {
                var sp_email = document.getElementById("sp_email").value;
                xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = go22;
                xmlhttp.open("GET", "fetch_review.jsp?sp_email=" + sp_email, true);
                xmlhttp.send();

            }
            function go22()
            {

                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("review").innerHTML = xmlhttp.responseText;

                }

            }
        </script>
    </head>
    <body onload="go1()">
        <%  if(session.getAttribute("email")==null)
            {
              %>
            <%@include file="public_header.jsp" %>
            <% }
                 else
                 {
                %>
                <%@include file="user_header.jsp" %>
                <%
                    }
                     %>
        <div class="container">

            <%    String email = request.getParameter("email");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select * from service_provider where sp_email=\'" + email + "\'");
                if (rs1.next()) {

                    String sub_category = rs1.getString("sub_category");
                    String name = rs1.getString("name");
                    String photo_sp = rs1.getString("photo");

                    String phone = rs1.getString("phone");
                    String website = rs1.getString("website");
                    int starting_hour = Integer.parseInt(rs1.getString("starting_hour"));
                    int ending_hour = Integer.parseInt(rs1.getString("ending_hour"));
                    String per_hour_price = rs1.getString("per_hour_price");
                    String description = rs1.getString("description");
                    String latitude = rs1.getString("latitude");
                    String longitude = rs1.getString("longitude");
                    String sp_email = rs1.getString("sp_email");
            %>
            <input type="hidden" id="sp_email" value="<%=sp_email%>"/>
            <%                Class.forName("com.mysql.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2 = stmt2.executeQuery("select * from sub_categories where sub_category=\'" + sub_category + "\'");
                rs2.next();
                String photo = rs2.getString("photo");

            %>
            <div class="row">
                <img src="<%=photo%>" style="width: 100%;height: 300px"/><br>

            </div>
            <hr>



            <div class="row" style="border: solid 2px black">
                <div  data-toggle="collapse" data-target="#basic" style="background: #3e3d3d; color: white; padding: 10px">Basic Details <span class="glyphicon glyphicon-plus" style="float: right"></span></div>
                <div class="collapse in" id="basic">
                    <div style="margin-top: 20px"> 
                        <div class="col-sm-5"><img src="<%=photo_sp%>" style="width: 200px;height: 150px"/>
                            <label style="font-family: cursive;color:#3e3d3d;font-size: 20px"><%=name%></label>
                            <%  Class.forName("com.mysql.jdbc.Driver");
                                Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                                Statement stmt4 = conn4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs4 = stmt4.executeQuery("select avg(num) as average from rating where sp_email=\'" + sp_email + "\'");
                                if (rs4.next()) {
                                    float f = rs4.getFloat("average");
                                    int a = (int) (f);
                                    for (int i = 1; i <= a; i++) {

                            %>
                            <img src="./filled_star.png" height="20" width="20"/> 
                            <%}
                                if ((f - a) == 0) {
                                    for (int i = 1; i <= 5 - a; i++) {
                            %>
                            <img src="./empty_star.png" height="20" width="20"/>
                            <%
                                }
                            } else {

                            %>
                            <img src="./half-filled-star.png" height="20" width="20"/>
                            <%  for (int i = 1; i <= 4 - a; i++) {
                            %>
                            <img src="./empty_star.png" height="20" width="20"/>
                            <%  }
                                    }
                                }
                            %></div> 
                        <div class="col-sm-offset-11"><input type="button" value="Book" id="book" class="bk"  onclick="check()" style="color: white;background: #3e3d3d"/></div></div>


                    <div class="col-sm-8 col-sm-offset-2" style="background-color:white;padding: 20px;margin-top: 10px">

                        <center>

                            <div class="form-group"><label class="col-sm-6">Email:</label>
                                <div class="col-sm-6"><label><%=email%></label></div>
                            </div>



                            <div class="form-group"><label class="col-sm-6">Phone:</label>
                                <div class="col-sm-6"><label><%= phone%></label></div>
                            </div>

                            <div class="form-group"><label class="col-sm-6">Website:</label>
                                <div class="col-sm-6"><label><%= website%></label></div>
                            </div>

                            <div class="form-group"><label class="col-sm-6">Starting Hour:</label>

                                <%
                                    if (starting_hour <= 12) {
                                %>
                                <div class="col-sm-6"><label><%= starting_hour%> am</label></div>
                                <% } else if (starting_hour > 12) {
                                    starting_hour = starting_hour - 12;
                                %>
                                <div class="col-sm-6"><label><%= starting_hour%> pm</label></div>
                                <%
                                    }
                                %>

                            </div>



                            <div class="form-group"><label class="col-sm-6">Ending Hour:</label>
                                <%
                                    if (ending_hour <= 12) {
                                %>
                                <div class="col-sm-6"><label><%= ending_hour%> am</label></div>
                                <% } else if (ending_hour > 12) {
                                    ending_hour = ending_hour - 12;
                                %>
                                <div class="col-sm-6"><label><%= ending_hour%> pm</label></div>
                                <%
                                    }
                                %>


                            </div>

                            <div class="form-group"><label class="col-sm-6">Per Hour Price:</label>
                                <div class="col-sm-6"><label><%= per_hour_price%></label></div>
                            </div>


                            <div class="form-group"><label class="col-sm-6">Description:</label>
                                <div class="col-sm-6"><label><%=description%></label></div>
                            </div>
                            <input type="hidden" id="lat1" value="<%= latitude%>"/>
                            <input type="hidden" id="lng1" value="<%= longitude%>"/>

                        </center>
                    </div>

                </div>

            </div>

            <div class="row" style="border: solid 2px black; margin-top: 20px">
                <div  data-toggle="collapse" data-target="#gallery" style="background:#3e3d3d; color: white; padding: 10px">Gallery <span class="glyphicon glyphicon-plus" style="float: right"></span></div>
                <div id="gallery" class="collapse">

                    <%

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                        Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs3 = stmt3.executeQuery("select * from work_gallery where sp_email=\'" + email + "\'");
                        while (rs3.next()) {
                            String photo3 = rs3.getString("photo");
                    %>


                    <a href="<%=photo3%>" data-lightbox="image-1" title="image1"> <img src="<%= photo3%>"  class="col-sm-3" style="width: 200px; height: 200px;margin: 20px; border: solid 1px black"/></a>




                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="row" style="border: solid 2px black; margin-top: 20px">
                <div  data-toggle="collapse" data-target="#map" style="background: #3e3d3d; color: white; padding: 10px">Locate Us On <span class="glyphicon glyphicon-plus" style="float: right"></span></div>
                <div id="map" class="collapse in">
                    <div id="maps1" style="width: 100%; height: 300px;"> 

                    </div>

                </div>
            </div>

            <div class="row" style="border: solid 2px black; margin-top: 20px;margin-bottom: 20px">
                <div  data-toggle="collapse" data-target="#rating" style="background: #3e3d3d; color: white; padding: 10px">User Ratings<span class="glyphicon glyphicon-plus" style="float: right"></span></div>  
                <div id="rating" class="collapse">
                    <div class="col-sm-offset-10" style="margin-top: 20px"><input type="button" style="background: #3e3d3d;color:white;font-family: initial;font-size: 20px" value="Add New Rating" onclick="rate()"/></div>
                    <div id="review"></div>
                </div>


            </div>
        </div>
        <!-- Modal -->
        <div class="modal" id="myModal" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="background: #fff">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row"><div class=" col-sm-2" ><label style="font-size: 20px;font-family: cursive;color: #3e3d3d"><b>Enter Email</b></label></div> 

                                <div class="col-sm-4"><input type="text" name="un" class="form-control" id="em" /><br></div></div>
                            <div class="row"><div class=" col-sm-2" ><label style="font-size: 20px;font-family: cursive;color: #3e3d3d"><b>Enter Password</b></label></div>

                                <div class="col-sm-4"> <input type="password" name="ps" class="form-control" id="ps" /><br><br></div></div>

                                <div class="row"><div class="col-sm-offset-2">  <input type="button" value="Login" class="btn btn-lg btn-success" onclick="login()" style="background:#3e3d3d;color: white"/></div></div>
                        </div>                  

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal -->
        <div class="modal" id="LoginModal" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="background: #fff">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row"><div class=" col-sm-2" ><label style="font-size: 20px;font-family: cursive;color: #3e3d3d"><b>Enter Email</b></label></div> 

                                <div class="col-sm-4"><input type="text" name="un" class="form-control" id="em1" /><br></div></div>
                            <div class="row"><div class=" col-sm-2" ><label style="font-size: 20px;font-family: cursive;color: #3e3d3d"><b>Enter Password</b></label></div>

                                <div class="col-sm-4"> <input type="password" name="ps" class="form-control" id="ps1" /><br><br></div></div>

                                <div class="row"><div class="col-sm-offset-2">  <input type="button" value="Login" class="btn btn-lg" onclick="userlogin()" style="color: white;background: #3e3d3d"/></div></div>
                        </div>                  

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal -->
        <div class="modal" id="RatingModal" >
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="background: #fff">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>

                    </div>
                    <div class="modal-body">


                        <img id="rating_1" src="./empty_star.png"  height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                        <img id="rating_2" src="./empty_star.png"  height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                        <img id="rating_3" src="./empty_star.png" height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                        <img id="rating_4" src="./empty_star.png"  height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                        <img id="rating_5" src="./empty_star.png" height="20" width="20" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                        Enter Reviews<br>
                        <textarea id="ta"></textarea><br>
                        <input type="button" value="ADD" onclick="setRating()" style="color: white;background: #3e3d3d"/>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
--%>