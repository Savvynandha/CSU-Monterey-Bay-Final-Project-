
<%--
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/lightbox.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%@include file="user_header.jsp"%>
                    <div class="container" style="min-height: 100px">
            <%
              
//         String user_email=session.getAttribute("user_email").toString();
           String user_email=request.getParameter("email");
           String password=request.getParameter("pass");
           session.setAttribute("user_email", user_email);
         String username=user_email;
         String actualPassword ="";
         Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb","root","komal");
        Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from user where email=\'"+user_email+"\'");

            if(rs.next())
            {
                username = rs.getString("name");
                actualPassword = rs.getString("password");
            }
            
           if(actualPassword.compareTo(password)==0)
             out.println("matching"); 
           else
             out.println("Wrong password!");
        %>
        
        <center>  <h1>Welcome <%= username %></h1></center>
            </div>
			<form class="container" style="min-height: 520px">
			<center
			<div>
					<label style="color:rgb(25,52,81);font-size: 50px;font-family: times;margin-top: 25px">Welcome <%=username%></label><br><br>
                   <a href="user_changepassword.jsp" style="color:green;font-size: 40px;font-family:initial">Change password</a><br>
                   <a href="view_user_booking.jsp" style="color:green;font-size: 40px;font-family:initial">View My Page(s)</a><br>
                </div>
			</center>
			</form>
                     <%@include file="footer.jsp"%>
    </body>

</html>


--%>

<%---------------------- code below is test code only, it was added on Jun 4 should be deleted if not working, same source as the unoriginal code ------------------------------------------%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="user_header.jsp" %>
    <center>
        <form class="container" style="min-height: 520px">
        <%
            
          String user_email=request.getParameter("un");
          String password=request.getParameter("ps");
        //String email=session.getAttribute("email").toString();
        String username=""; //session.getAttribute("name").toString();
        Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb","root","komal");
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=stmt.executeQuery("select * from user where email=\'"+user_email+"\'");
    if(rs.next())
    {
        username=rs.getString("name");
    }
                %>
                <div class="container" style="margin-top: 70px">
                    
                    <label style="color:rgb(25,52,81);font-size: 50px;font-family:roboto cursive;margin-top: 25px">Welcome Tejus<%=username%></label><br><br>
                   <a href="user_changepassword.jsp" style="color:#337ab7;font-size: 40px;font-family:roboto">Change password</a><br>
                    <a href="view_user_booking.jsp" style="color:#337ab7;font-size: 40px;font-family:roboto">My bookings</a><br>
                </div>
        </form>
    </center>
                    <%@include file="footer.jsp" %>
    </body>
</html>

<%-- From Desktop folder --%>

<%---------------------- code below is not original ------------------------------------------%>
<%--
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
        <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="user_header.jsp" %>
    <center>
        <form class="container" style="min-height: 520px">
        <%
        String user_email=request.getParameter("email").toString();
        String username=user_email;
		//String username=request.getParameter("name").toString();
        Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb","root","komal");
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    ResultSet rs=stmt.executeQuery("select * from user where email=\'"+user_email+"\'");
    if(rs.next())
    {
        username=rs.getString("name");
    }
                %>
                <div class="container" style="margin-top: 70px">
                    
                    <label style="color:rgb(25,52,81);font-size: 50px;font-family: cursive;margin-top: 25px">Welcome <%=username%></label><br><br>
                   <a href="user_changepassword.jsp" style="color:green;font-size: 40px;font-family:initial">Change password</a><br>
                   <a href="view_user_booking.jsp" style="color:green;font-size: 40px;font-family:initial">View My Page(s)</a><br>
                </div>
        </form>
    </center>
                    <%@include file="footer.jsp" %>
    </body>
</html>
--%>
<%-- not project file --%>
