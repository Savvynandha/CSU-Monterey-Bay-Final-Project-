
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <script>

            function del(name)
            {
                var ans = confirm("Are you sure you want to cancel this booking?");
                if (ans)
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.open("GET", "del_user_booking.jsp?name=" + name, true);
                    xmlhttp.onreadystatechange = function ()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            document.getElementById("booking").innerHTML = xmlhttp.responseText;
                            alert("Booking Deleted");
                        }
                    };




                    xmlhttp.send();
                }
            }
    
        </script>
    </head>
    <body>
        <%@include file="user_header.jsp"%>
        <div class="container" style="min-height: 523px">

            <div id="booking">
                <center>  <h1>My Bookings</h1></center>
                <div class="form-group">  </div>
                    <% String user_email = session.getAttribute("email").toString();//In order to revert back to using with original code in user_home.jsp change session.getAttribute("email")to session.getAttribute("user_email")
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs = stmt.executeQuery("select * from booking where user_email=\'" + user_email + "\'");
                        if (rs.next()) {
                            rs.previous();
                    %>


                <table class="table table-hover">
                    <thead class="" style="background: #3e3d3d;color:white">
                        <tr>
                            <td>Booking Id</td>
                            <td>Date</td>
                            <td>Total Price</td>
                             <td>Service Provider</td>
                            <td>Time Slot</td>
                            <td></td>
                        </tr>
                    </thead>
                    <% while (rs.next()) {
                            int b_id = rs.getInt("booking_id");
                            Date d1 = rs.getDate("date");
                            Calendar cl=Calendar.getInstance();
                            java.sql.Date d2=new java.sql.Date(cl.getTimeInMillis());
                             String sp_email = rs.getString("sp_email");
                            int price = rs.getInt("total_price");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs1 = stmt1.executeQuery("select * from service_provider where sp_email=\'" + sp_email + "\'");
                            if (rs1.next()) {
                                String name = rs1.getString("name");
                                String photo = rs1.getString("photo");

                    %> 

                    <tr>
                        <td><%=b_id%></td> 
                        <td><%=d1%></td> 
                        <td><%=price%></td> 
                        <td> <img src="<%=photo%>" style="width:100px;height: 100px"/><br>
                      <%=name%>

                        <td>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                                Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs2 = stmt2.executeQuery("select * from booking_detail where booking_id=\'" + b_id + "\'");
                                while (rs2.next()) {
                                    int start_hr = rs2.getInt("starting_hour");
                                    int end_hr = rs2.getInt("ending_hour");
                            %>
                            <% if (start_hr <= 12) {
                            %>

                            <%=start_hr%>am
                            <% } else {

                            %>
                            <%= (start_hr - 12)%>pm

                            <%
                                }
                                if (start_hr + 1 <= 12) {
                            %>

                            -<%=start_hr + 1%>am
                            <% } else {

                            %>
                            -<%= (start_hr + 1) - 12%>pm
                            <%
                            }%>
                            <br>

                            <%}%>

                        </td>

                         <%
                            if(d1.compareTo(d2)>0)
                            {
                        %>
                        <td>
                            <input type="button" class="btn btn-success" value="Cancel" onclick="del('<%=b_id%>')" style="background: #3e3d3d;color:white"/>
                        </td>
                        <%
                            }
else
{
%>
<td>
    Already Attended
</td>


<%}
                        %>




                    </tr>

                    <%  }
                        }

                    } else {
                    %>
                    <h1>No Booking</h1>
                    <%}
                    %>


                </table>
            </div>
        </div>
                           <%@include file="footer.jsp"%>
    </body>
</html>
<%--
--%>
<%-- code below is not original --%>

