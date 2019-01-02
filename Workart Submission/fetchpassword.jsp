<%--
<%@page import="java.sql.*"%>
 <html>
 <div class="container" style="min-height: 523px">
<%
     String email = request.getParameter("email");
     String security_ques = request.getParameter("sec_ques");
     String security_ans = request.getParameter("sec_ans");
     Class.forName("com.mysql.jdbc.Driver");
     Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
     Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
     ResultSet rs = stmt.executeQuery("select * from user where email=\'" + email + "\' and security_question=\'"+security_ques+"\' and security_answer=\'"+security_ans+"\'");
     if(rs.next())
     {String password=rs.getString("password");
      %>
      <div align=middle>
      <h1> <label>Your password is: <%=password%></label></h1>
      </div>
      <%
     
     }
     else
{
response.sendRedirect("user_forgotpassword1.jsp?msg=Incorrect credentials");

}



    %>
              
 </div>
    <%@include file="footer.jsp"%>
 --%>
 
 
<%@page import="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="user_header.jsp" %>
        <form style="min-height: 410px;margin-top: 100px">
         <%       String email = request.getParameter("email");
                  String sq_qstn=request.getParameter("sec_ques");
                   String sq_ans=request.getParameter("sec_ans");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mydb", "root", "komal");
                Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2 = stmt2.executeQuery("select * from user where security_question=\'" + sq_qstn + "\' and security_answer=\'" + sq_ans + "\' ");

                if (rs2.next()) {
                  String password=rs2.getString("password");
                         
         %>
    <center> <label style="font-size: 30px;color: rgb(25,52,81)">This is your password: <%=password %></label></center>
         <%
             
             }
      else
            response.sendRedirect("user_forgot_password1.jsp?msg=cerdentials do not match");
             %>
        </form>
      <%@include file="footer.jsp" %>      
    </body>
</html>
   